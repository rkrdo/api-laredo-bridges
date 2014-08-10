import returnUnavailable from './return_unavailable';

export default function(value) {
  var lanes = (value === "1") ? ' lane' : ' lanes';
  return returnUnavailable(value, lanes);
}
