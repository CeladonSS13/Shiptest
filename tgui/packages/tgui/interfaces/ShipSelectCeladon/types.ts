export type Data = {
  ships: Ship[];
  shipSpawnAllowed: boolean;
  purchaseBanned: boolean;
  autoMeet: boolean;
  playMin: boolean;
  templates: Template[];
  shipSpawning: boolean;
};

export type Template = {
  name: string;
  faction: number;
  desc: string;
  tags: string[];
  crewCount: number;
  limit: number;
  curNum: number;
  minTime: number;
  shortName: string;
};

export type Ship = {
  name: string;
  faction: number;
  class: string;
  desc: string;
  tags: string[];
  memo: string;
  jobs: Job[];
  manifest: string;
  joinMode: string;
  ref: string;
};

export type Job = {
  name: string;
  slots: number;
  minTime: number;
  ref: string;
};

export const applyStates = {
    open: 'Open',
    apply: 'Apply',
    closed: 'Locked',
};
