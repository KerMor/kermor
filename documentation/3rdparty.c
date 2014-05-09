/**
@defgroup 3rdparty Third-Party programs

Here all third-party software and algorithms utilized in KerMor are briefly described
along with short installation notes.

@todo complete!

*/

/*@section md5 MD5-Algorithm
Found under http://www.mathworks.com/matlabcentral/fileexchange/25921
and is used to create KerMorObject-IDs.*/

typedef enum {
	Access,
	SetAccess,
	GetAccess,
	ListenAccess,
	NotifyAccess

} MatlabAccessEnum;