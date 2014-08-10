import returnUnavailable from './return_unavailable';

export default function(value) {
  if (value === "0") { return 'No Delay'; }
  return returnUnavailable(value, false);
}
