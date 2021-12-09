styles = [
  { name: 'ABSTRACT', status: 1 },
  { name: 'ARCHITECTURAL', status: 1 },
  { name: 'ASTRO', status: 1 },
  { name: 'B&W', status: 1 },
  { name: 'CITYSCAPE', status: 1 },
  { name: 'COMPOSITE', status: 1 },
  { name: 'DRONE', status: 1 },
  { name: 'DOUBLE EXPOSURE', status: 1 },
  { name: 'FASHION', status: 1 },
  { name: 'FINE ART', status: 1 },
  { name: 'INFRARED', status: 1 },
  { name: 'LANDSCAPE', status: 1 },
  { name: 'LONG EXPOSURE', status: 1 },
  { name: 'MACRO', status: 1 },
  { name: 'JOURNALISM', status: 1 },
  { name: 'PORTRAITURE', status: 1 },
  { name: 'SEASCAPE', status: 1 },
  { name: 'SPORTS', status: 1 },
  { name: 'STILL LIFE', status: 1 },
  { name: 'STREET', status: 1 },
  { name: 'UNDERWATER', status: 1 },
  { name: 'WILDLIFE', status: 1 }
]

Style.bulk_insert(values: styles) if Style.count.zero?
