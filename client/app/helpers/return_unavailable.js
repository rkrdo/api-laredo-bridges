export default function(value, extra_words) {
  var final_val = extra_words ? value + extra_words : value;
  return (value === null || value.length === 0) ? 'Unavailable' : final_val;
}
