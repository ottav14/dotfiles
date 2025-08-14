local utils = require 'mp.utils'
local msg = require 'mp.msg'

-- Paths
local playlist_dir = "/mnt/channels"
local static_video = "/mnt//static.mp4"

function load_random_playlist()
    local files = utils.readdir(playlist_dir, "files")
    if not files then
        msg.error("Could not read playlist directory: " .. playlist_dir)
        return
    end

    local playlists = {}
    for _, file in ipairs(files) do
        if file:match("%.m3u$") then
            table.insert(playlists, playlist_dir .. "/" .. file)
        end
    end

    if #playlists == 0 then
        msg.warn("No .m3u playlists found in: " .. playlist_dir)
        return
    end

    local idx = math.random(1, #playlists)
    local random_playlist = playlists[idx]

    msg.info("Loading random playlist: " .. random_playlist)
    mp.commandv("loadlist", random_playlist, "replace")
end

-- Delay a bit to avoid conflict with initial loading
mp.register_event("idle", load_random_playlist)


local playlists = {}
local current_index = nil

-- Scan .m3u files in the fixed directory
local function load_playlists()
    playlists = {}

    local files = utils.readdir(playlist_dir, "files")
    if not files then
		msg.error("Could not read playlist directory: " .. playlist_dir)
        return
    end

    for _, file in ipairs(files) do
        if file:match("%.m3u$") then
            table.insert(playlists, playlist_dir .. "/" .. file)
        end
    end

    table.sort(playlists)
end

-- Detect the index of the currently loaded playlist
local function detect_current_index()
    local current = mp.get_property("path")
    for i, pl in ipairs(playlists) do
        if current and current:find(pl, 1, true) then
            current_index = i
            return
        end
    end
    current_index = nil
end

-- Load the next or previous playlist
local function switch_playlist(direction)
    if #playlists == 0 then return end

    if current_index == nil then
        detect_current_index()
    end

    if current_index == nil then
        current_index = 1
    else
        current_index = current_index + direction
        if current_index < 1 then
            current_index = #playlists
        elseif current_index > #playlists then
            current_index = 1
        end
    end

    local target = playlists[current_index]
    local _, filename = utils.split_path(target)
    msg.info("Switching to playlist: " .. target)
    mp.osd_message("Loading playlist: " .. filename)
	mp.commandv("playlist-clear")
    mp.commandv("loadfile", static_video, "append")
    mp.commandv("loadlist", target, "append")
	mp.commandv("playlist-next", "force")
    mp.set_property_number("playlist-play-index", 0)

end

-- Bind ← and → keys
mp.add_key_binding("UP", "next-playlist", function()
    load_playlists()
    switch_playlist(1)
end)

mp.add_key_binding("DOWN", "prev-playlist", function()
    load_playlists()
    switch_playlist(-1)
end)
