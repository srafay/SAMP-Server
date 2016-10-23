#define RECORDING "npcbank" //This is the filename of your recording without the extension.
#define RECORDING_TYPE 2 //1 for in vehicle and 2 for on foot.

#include <a_npc>
main(){}
public OnRecordingPlaybackEnd()
{
	StartRecordingPlayback(2, "npcbank");
}

  public OnNPCSpawn()
  {
  	StartRecordingPlayback(2, "npcbank.rec");
  }
