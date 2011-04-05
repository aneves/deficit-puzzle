// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function truncate(n, shift) {
	shift |= 0;
	var res = n;
	if(shift != 0) {
		res = res * pow(10, shift);
	}
	res = Math[n > 0 ? "floor" : "ceil"](res);

	if(shift != 0) {
		res = res / pow(10,shift);
	}
	return res;
}

function pow(base, amount) {
	if( base == 10 && amount == 2 ) {
		// Meh, let's save some TICs.
		return 100;
	}
	if( amount > 0 ) {
		return base * pow(base, amount-1);
	}
	if( amount == 0 ) {
		return 0;
	}
	throw "Can't power to negative values.";
}

function limit( value, min, max ) {
	if( value < min ) {
		return min;
	}
	if( value > max ) {
		return max;
	}
	return value;
}
