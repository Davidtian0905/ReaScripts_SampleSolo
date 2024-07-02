-- @version 1.0.0
-- @author David.tian
-- @B站 https://space.bilibili.com/538201523/
-- @Github https://github.com/Davidtian0905/ReaScripts_SampleSolo

function UnmuteAllTracksAtSameLevel()
  local selectedTrack = reaper.GetSelectedTrack(0, 0)
  if not selectedTrack then return end
  
  local selectedTrackDepth = GetTrackDepth(selectedTrack)
  
  reaper.Undo_BeginBlock()

  local trackCount = reaper.CountTracks(0)
  
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if GetTrackDepth(checkTrack) == selectedTrackDepth then
      reaper.SetMediaTrackInfo_Value(checkTrack, "B_MUTE", 0)  -- Unmute all tracks at the same level
    end
  end
  
  reaper.Undo_EndBlock("Unmute All Tracks at Same Level", -1)
  reaper.UpdateArrange()
end

function GetTrackDepth(track)
  local depth = 0
  local parent = reaper.GetParentTrack(track)
  while parent do
    depth = depth + 1
    parent = reaper.GetParentTrack(parent)
  end
  return depth
end

UnmuteAllTracksAtSameLevel()
