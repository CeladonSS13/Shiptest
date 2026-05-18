export type Data = {
  points: number;
  outpostDocked: boolean;
  onShip: boolean;
  numMissions: number;
  maxMissions: number;
  shipMissions: Array<Mission>;
  outpostMissions: Array<Mission>;
  beaconZone: string;
  beaconName: string;
  message: string;
  printMsg: string;
  canBuyBeacon: boolean;
  factionTheme?: string;
};

export type Mission = {
  ref: string;
  actStr: string;
  name: string;
  desc: string;
  progressStr: string;
  progressPer: number;
  value: number;
  remaining: number;
  duration: number;
  timeStr: string;
};
