/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

type Gas = {
  id: string;
  path: string;
  name: string;
  label: string;
  color: string;
};

// UI states, which are mirrored from the BYOND code.
export const UI_INTERACTIVE = 2;
export const UI_UPDATE = 1;
export const UI_DISABLED = 0;
export const UI_CLOSE = -1;

// All game related colors are stored here
export const COLORS = {
  // Department colors
  department: {
    captain: '#c06616',
    security: '#e74c3c',
    medbay: '#3498db',
    science: '#9b59b6',
    engineering: '#f1c40f',
    cargo: '#f39c12',
    centcom: '#00c100',
    other: '#c38312',
  },
  // Damage type colors
  damageType: {
    oxy: '#3498db',
    toxin: '#2ecc71',
    burn: '#e67e22',
    brute: '#e74c3c',
  },
  // reagent / chemistry related colours
  reagent: {
    acidicbuffer: '#fbc314',
    basicbuffer: '#3853a4',
  },
} as const;

// Colors defined in CSS
export const CSS_COLORS = [
  'black',
  'white',
  'red',
  'orange',
  'yellow',
  'olive',
  'green',
  'teal',
  'blue',
  'violet',
  'purple',
  'pink',
  'brown',
  'grey',
  'good',
  'average',
  'bad',
  'label',
];

/* IF YOU CHANGE THIS KEEP IT IN SYNC WITH CHAT CSS */
export const RADIO_CHANNELS = [
  {
    name: 'Cybersun',
    freq: 1203,
    color: '#4c9c9c',
  },
  {
    name: 'New Gorlex',
    freq: 1205,
    color: '#c59973',
  },
  {
    name: 'Syndicate',
    freq: 1213,
    color: '#8f4a4b',
  },
  {
    name: 'Syndicate (Long-Range)',
    freq: 1215,
    color: '#8f4a4b',
  },
  {
    name: 'Syndicate (Short)',
    freq: 1223,
    color: '#ac5f61',
  },
  {
    name: 'NT-CC',
    freq: 1237,
    color: '#2681a5',
  },
  {
    name: 'SUNS',
    freq: 1325,
    color: '#4e3399',
  },
  {
    name: 'SUNS (Long-Range)',
    freq: 1327,
    color: '#4e3399',
  },
  {
    name: 'SUNS (Short)',
    freq: 1329,
    color: '#7153c6',
  },
  {
    name: 'IRMG',
    freq: 1333,
    color: '#b88646',
  },
  {
    name: 'IRMG (Long-Range)',
    freq: 1335,
    color: '#b88646',
  },
  {
    name: 'IRMG (Short)',
    freq: 1337,
    color: '#c79f6a',
  },
  {
    name: 'Elysium',
    freq: 1339,
    color: '#12692f',
  },
  {
    name: 'Elysium (Long-Range)',
    freq: 1341,
    color: '#12692f',
  },
  {
    name: 'Elysium (Short)',
    freq: 1343,
    color: '#199943',
  },
  {
    name: 'Nanotrasen',
    freq: 1345,
    color: '#28a4ec',
  },
  {
    name: 'Makosso-Warra',
    freq: 1351,
    color: '#c68cfa',
  },
  {
    name: 'Nanotrasen (Long-Range)',
    freq: 1347,
    color: '#28a4ec',
  },
  {
    name: 'Nanotrasen (Short)',
    freq: 1349,
    color: '#57b8f0',
  },
  {
    name: 'SolFed',
    freq: 1353,
    color: '#5a6a88',
  },
  {
    name: 'SolFed (Long-Range)',
    freq: 1355,
    color: '#5a6a88',
  },
  {
    name: 'SolFed (Short)',
    freq: 1357,
    color: '#7589af',
  },
  {
    name: 'Raider (Long-Range)',
    freq: 1417,
    color: '#ab9b21',
  },
  {
    name: 'Raider (Short)',
    freq: 1419,
    color: '#fcdf03',
  },
  {
    name: 'Ramzi (Long-Range)',
    freq: 1421,
    color: '#5a4d3f',
  },
  {
    name: 'Ramzi (Short)',
    freq: 1423,
    color: '#796755',
  },
  {
    name: 'Unidentified (Long-Range)',
    freq: 1425,
    color: '#3d3d3d',
  },
  {
    name: 'Unidentified (Short)',
    freq: 1427,
    color: '#5d5d5d',
  },
  {
    name: 'Emergency',
    freq: 1429,
    color: '#dd3535',
  },
  {
    name: 'Common',
    freq: 1459,
    color: '#1ecc43',
  },
  {
    name: 'Wideband',
    freq: 1691,
    color: '#8de7b6',
  },
] as const;

const GASES = [
  {
    id: 'o2',
    path: '/datum/gas/oxygen',
    name: 'Oxygen',
    label: 'O₂',
    color: 'blue',
  },
  {
    id: 'n2',
    path: '/datum/gas/nitrogen',
    name: 'Nitrogen',
    label: 'N₂',
    color: 'red',
  },
  {
    id: 'co2',
    path: '/datum/gas/carbon_dioxide',
    name: 'Carbon Dioxide',
    label: 'CO₂',
    color: 'grey',
  },
  {
    id: 'plasma',
    path: '/datum/gas/plasma',
    name: 'Plasma',
    label: 'Plasma',
    color: 'pink',
  },
  {
    id: 'water_vapor',
    path: '/datum/gas/water_vapor',
    name: 'Water Vapor',
    label: 'H₂O',
    color: 'lightsteelblue',
  },
  {
    id: 'hypernoblium',
    path: '/datum/gas/hypernoblium',
    name: 'Hyper-noblium',
    label: 'Hyper-nob',
    color: 'teal',
  },
  {
    id: 'n2o',
    path: '/datum/gas/nitrous_oxide',
    name: 'Nitrous Oxide',
    label: 'N₂O',
    color: 'bisque',
  },
  {
    id: 'no2',
    path: '/datum/gas/nitrium',
    name: 'Nitrium',
    label: 'Nitrium',
    color: 'brown',
  },
  {
    id: 'tritium',
    path: '/datum/gas/tritium',
    name: 'Tritium',
    label: 'Tritium',
    color: 'limegreen',
  },
  {
    id: 'bz',
    path: '/datum/gas/bz',
    name: 'BZ',
    label: 'BZ',
    color: 'mediumpurple',
  },
  {
    id: 'pluoxium',
    path: '/datum/gas/pluoxium',
    name: 'Pluoxium',
    label: 'Pluoxium',
    color: 'mediumslateblue',
  },
  {
    id: 'miasma',
    path: '/datum/gas/miasma',
    name: 'Miasma',
    label: 'Miasma',
    color: 'olive',
  },
  {
    id: 'freon',
    path: '/datum/gas/freon',
    name: 'Freon',
    label: 'Freon',
    color: 'paleturquoise',
  },
  {
    id: 'h2',
    path: '/datum/gas/hydrogen',
    name: 'Hydrogen',
    label: 'H₂',
    color: 'white',
  },
  {
    id: 'healium',
    path: '/datum/gas/healium',
    name: 'Healium',
    label: 'Healium',
    color: 'salmon',
  },
  {
    id: 'proto_nitrate',
    path: '/datum/gas/proto_nitrate',
    name: 'Proto Nitrate',
    label: 'Proto-Nitrate',
    color: 'greenyellow',
  },
  {
    id: 'zauker',
    path: '/datum/gas/zauker',
    name: 'Zauker',
    label: 'Zauker',
    color: 'darkgreen',
  },
  {
    id: 'halon',
    path: '/datum/gas/halon',
    name: 'Halon',
    label: 'Halon',
    color: 'purple',
  },
  {
    id: 'helium',
    path: '/datum/gas/helium',
    name: 'Helium',
    label: 'He',
    color: 'aliceblue',
  },
  {
    id: 'antinoblium',
    path: '/datum/gas/antinoblium',
    name: 'Antinoblium',
    label: 'Anti-Noblium',
    color: 'maroon',
  },
  {
    id: 'nitrium',
    path: '/datum/gas/nitrium',
    name: 'Nitrium',
    label: 'Nitrium',
    color: 'brown',
  },
  {
    id: 'cl2',
    path: '/datum/gas/cl2',
    name: 'Chlorine',
    label: 'Cl₂',
    color: 'yellow',
  },
  {
    id: 'hcl',
    path: '/datum/gas/hcl',
    name: 'Hydrogen Chloride',
    label: 'HCl',
    color: 'greenyellow',
  },
] as const;

// Returns gas label based on gasId
export const getGasLabel = (gasId: string, fallbackValue?: string) => {
  if (!gasId) return fallbackValue || 'None';

  const gasSearchString = gasId.toLowerCase();

  for (let idx = 0; idx < GASES.length; idx++) {
    if (GASES[idx].id === gasSearchString) {
      return GASES[idx].label;
    }
  }

  return fallbackValue || 'None';
};

// Returns gas color based on gasId
export const getGasColor = (gasId: string) => {
  if (!gasId) return 'black';

  const gasSearchString = gasId.toLowerCase();

  for (let idx = 0; idx < GASES.length; idx++) {
    if (GASES[idx].id === gasSearchString) {
      return GASES[idx].color;
    }
  }

  return 'black';
};

// Returns gas object based on gasId
export const getGasFromId = (gasId: string): Gas | undefined => {
  if (!gasId) return;

  const gasSearchString = gasId.toLowerCase();

  for (let idx = 0; idx < GASES.length; idx++) {
    if (GASES[idx].id === gasSearchString) {
      return GASES[idx];
    }
  }
};

// Returns gas object based on gasPath
export const getGasFromPath = (gasPath: string): Gas | undefined => {
  if (!gasPath) return;

  for (let idx = 0; idx < GASES.length; idx++) {
    if (GASES[idx].path === gasPath) {
      return GASES[idx];
    }
  }
};
