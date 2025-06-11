local utils = require 'mp.utils'

-- Folder containing your playlists (.m3u files)
local playlist_folder = "/home/dom/projects/dcrt/channels"
local static_video = "/home/dom/projects/dcrt/static.mp4"

local playlists = {}
local index = 1

local menu_visible = false
local menu_index = 1
local options = {"Play", "Pause", "Quit"}

function draw_menu()
    if not menu_visible then return end

	mp.osd_message("FART!")

    --local ass = mp.create_osd_ass(1280, 720)
    --ass:append("{\\an7}{\\fs20}{\\b1}Menu:\\N")
    --for i, option in ipairs(options) do
     --   if i == selected_index then
     --     ass:append("{\\b1}> " .. option .. "\\N")
     -- else
     --     ass:append("  " .. option .. "\\N")
     -- end
   -- end
    --mp.set_osd_ass(0, 0, ass.text)
end

-- Scan folder and load all .m3u files into playlists table
local function load_playlists()
    playlists = {}
    local files = utils.readdir(playlist_folder, "files")
    if not files then
        mp.msg.error("Could not read playlist folder: " .. playlist_folder)
        return
    end

    for _, file in ipairs(files) do
        if file:match("%.m3u$") then
            table.insert(playlists, playlist_folder .. "/" .. file)
        end
    end

    if #playlists == 0 then
        mp.msg.error("No .m3u playlists found in folder: " .. playlist_folder)
    end
end

local function load_playlist(i)
    if #playlists == 0 then
        mp.osd_message("No playlists found")
        return
    end
    if i < 1 then i = #playlists end
    if i > #playlists then i = 1 end
    index = i
	mp.commandv("loadfile", static_video)
    mp.commandv("loadlist", playlists[index], "append")
    local basename = playlists[index]:match("^.+/(.+)$")
	local channel_name = basename:gsub("%.m3u$", "")
    mp.osd_message(channel_name)

end

local function next_channel()
    load_playlist(index + 1)
end

local function prev_channel()
    load_playlist(index - 1)
end

-- Initialize playlists on script load
mp.set_property("loop-playlist", "inf")
mp.set_property("shuffle", "yes")
load_playlists()
load_playlist(index)

-- Bind keys
mp.add_key_binding("y", "toggle_menu", function()
    menu_visible = not menu_visible
    draw_menu()
end)

mp.add_key_binding("UP", "menu_up", function()
    if not menu_visible then 
		next_channel()
		return
	end
    selected_index = (selected_index - 2) % #options + 1
    draw_menu()
end)

mp.add_key_binding("DOWN", "menu_down", function()
    if not menu_visible then 
		prev_channel()
		return 
	end
    selected_index = selected_index % #options + 1
    draw_menu()
end)
