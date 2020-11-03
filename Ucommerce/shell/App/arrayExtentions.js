//in some browsers (ie6) indexOf and other functions doesn't exist. We must apply it if that is the case.

if (!('indexOf' in Array.prototype)) {
	Array.prototype.indexOf = function (find, i /*opt*/) {
		if (i === undefined) i = 0;
		if (i < 0) i += this.length;
		if (i < 0) i = 0;
		for (var n = this.length; i < n; i++)
			if (i in this && this[i] === find)
				return i;
		return -1;
	};
}
