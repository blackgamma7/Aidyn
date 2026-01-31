#include "globals.h"
#include "vobjects.h"

voxelObject * GetVoxelFromObjectLink(Borg9Data *b9,voxelObject *v,u16 type) {
  for(u16 i=0;i<51;i++) {
    if ((v->header).LinkID[0] == 0xffff) break;
    v = &b9->voxelObjs[i];
    if ((v->header).type == type) {
      return v;
    }
  }
  if ((v->header).type == type) {
    return v;
  }
  char buff [72];
  sprintf(buff,"Type: %d Not Found.\n",type);
  CRASH("GetVoxelObjectFromLink",buff);
}

void ProcessVoxelObjects(playerData *playerchar) {
  short shorts[2];
  
  Borg9Data *pBVar3 = gGlobals.gameVars.borg9DatPointer;
  playerchar->voxelReach = 100.0f;
  getZonePositionShorts(pBVar3,&(playerchar->collision).pos,&shorts[0],&shorts[1]);
  CollideSection* pbVar4 = getCollideSection(pBVar3,shorts[0],shorts[1]);
  if (pbVar4->voxelSceneCount == 0) return;
  for(u16 i=0;i<pbVar4->voxelSceneCount;i++){
    voxelObject *vox =&pBVar3->voxelObjs[pbVar4->voxelIndecies[i]];
    if((playerchar->isAlaron)&&(vox->header.Bitfeild&VOXEL_Flag400)){
      float dist = Vec3Dist(&(playerchar->collision).pos,&vox->header.pos);
      if ((dist < (vox->header).size) && (dist < playerchar->voxelReach)) {
          playerchar->voxelReach = dist;
          Vec3Copy(&vox->header.pos,&playerchar->voxelCoords);
        }
    }
    if ((((((vox->header).Bitfeild & VOXEL_Active)) && (gGlobals.ticker > (vox->header).timestamp)) &&
        (3 >= (vox->header).type - 7)) && ((vox->header).size >= Vec3Dist(&(playerchar->collision).pos,&vox->header.pos))) {
      switch(vox->header.type){
        case VOXEL_Camera:{
            processVoxelCamera(&(playerchar->collision).pos,vox,&gGlobals.gameVars.camera,gGlobals.delta);
            break;
        }
        case VOXEL_Dialouge:{
            if (((!isDialougeMode()) && (((vox->header).Bitfeild & VOXEL_Tangible))) && (Voxel_CheckProc(vox,playerchar)))
               dialouge_vobject_func(vox,0,i);
            break;
        }
        case VOXEL_Trigger:{
            if (((!isDialougeMode()) && (((vox->header).Bitfeild & VOXEL_Tangible))) && (Voxel_CheckProc(vox,playerchar))) 
                trigger_vobject_func(vox,0,i);
            break;
        }
        case VOXEL_Teleporter:{
            if (((!isDialougeMode()) && (((vox->header).Bitfeild & VOXEL_Tangible))) && (teleporter_obj_check(vox,playerchar)))
                teleporter_func(vox,0,i);
            break;
        }
      }
    }
  }
}

