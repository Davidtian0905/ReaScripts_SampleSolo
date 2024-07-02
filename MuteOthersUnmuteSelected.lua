-- @version 1.0.0
-- @author David.tian
-- @B站 https://space.bilibili.com/538201523/
-- @Github https://github.com/Davidtian0905/ReaScripts_SampleSolo


function MuteOtherTracksAtSameLevel()
  local selectedTrack = reaper.GetSelectedTrack(0, 0)
  if not selectedTrack then return end
  
  local selectedTrackDepth = GetTrackDepth(selectedTrack)
  
  reaper.Undo_BeginBlock()
  local trackCount = reaper.CountTracks(0)
  
  -- First, unset solo for all tracks at the same level
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if GetTrackDepth(checkTrack) == selectedTrackDepth then
      local soloState = reaper.GetMediaTrackInfo_Value(checkTrack, "I_SOLO")
      if soloState ~= 0 then
        reaper.SetMediaTrackInfo_Value(checkTrack, "I_SOLO", 0)
      end
    end
  end
  
  -- Then, proceed with the original mute logic
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if checkTrack ~= selectedTrack and GetTrackDepth(checkTrack) == selectedTrackDepth then
      reaper.SetMediaTrackInfo_Value(checkTrack, "B_MUTE", 1)  -- Mute other tracks
    end
  end
  
  -- Ensure the selected track is not muted
  reaper.SetMediaTrackInfo_Value(selectedTrack, "B_MUTE", 0)
  
  reaper.Undo_EndBlock("Mute Other Tracks at Same Level and Unset Solo", -1)
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

MuteOtherTracksAtSameLevel()
