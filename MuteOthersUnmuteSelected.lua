-- @version 1.0.0
-- @author David.tian
-- @B站 https://space.bilibili.com/538201523/
-- @Github https://github.com/Davidtian0905/ReaScripts_SampleSolo


function MuteOtherTracksAtSameParentLevel()
  local selectedTrack = reaper.GetSelectedTrack(0, 0)
  if not selectedTrack then return end
  
  local parentTrack = reaper.GetParentTrack(selectedTrack)
  
  reaper.Undo_BeginBlock()
  local trackCount = reaper.CountTracks(0)
  
  -- First, unset solo for all tracks at the same parent level
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if HasSameParent(checkTrack, selectedTrack) then
      local soloState = reaper.GetMediaTrackInfo_Value(checkTrack, "I_SOLO")
      if soloState ~= 0 then
        reaper.SetMediaTrackInfo_Value(checkTrack, "I_SOLO", 0)
      end
    end
  end
  
  -- Then, proceed with the mute logic for tracks at the same parent level
  for i = 0, trackCount - 1 do
    local checkTrack = reaper.GetTrack(0, i)
    if checkTrack ~= selectedTrack and HasSameParent(checkTrack, selectedTrack) then
      reaper.SetMediaTrackInfo_Value(checkTrack, "B_MUTE", 1)  -- Mute other tracks
    end
  end
  
  -- Ensure the selected track is not muted
  reaper.SetMediaTrackInfo_Value(selectedTrack, "B_MUTE", 0)
  
  reaper.Undo_EndBlock("Mute Other Tracks at Same Parent Level and Unset Solo", -1)
  reaper.UpdateArrange()
end

function HasSameParent(track1, track2)
  local parent1 = reaper.GetParentTrack(track1)
  local parent2 = reaper.GetParentTrack(track2)
  return parent1 == parent2
end

MuteOtherTracksAtSameParentLevel()
