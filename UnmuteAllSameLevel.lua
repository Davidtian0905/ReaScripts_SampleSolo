-- @version 1.0.0
-- @author David.tian
-- @B站 https://space.bilibili.com/538201523/
-- @Github https://github.com/Davidtian0905/ReaScripts_SampleSolo

function UnmuteAllTracksAtSameParentLevel()
  local selectedTrack = reaper.GetSelectedTrack(0, 0)
  if not selectedTrack then return end
  
  local selectedTrackParent = reaper.GetParentTrack(selectedTrack)
  
  reaper.Undo_BeginBlock()
  local trackCount = reaper.CountTracks(0)
  
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if reaper.GetParentTrack(checkTrack) == selectedTrackParent then
      reaper.SetMediaTrackInfo_Value(checkTrack, "B_MUTE", 0) -- Unmute all tracks with the same parent
    end
  end
  
  reaper.Undo_EndBlock("Unmute All Tracks at Same Parent Level", -1)
  reaper.UpdateArrange()
end

UnmuteAllTracksAtSameParentLevel()
