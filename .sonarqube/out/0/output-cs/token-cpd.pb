ˆ+
`E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Controllers\AuthController.cs
	namespace 	
FarmaciaAPI
 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AuthController 
:  !

Controller" ,
{ 
private 
IUserService 
userService (
;( )
public 
AuthController 
( 
IUserService *
userService+ 6
)6 7
{ 	
this 
. 
userService 
= 
userService *
;* +
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
RegisterAsync) 6
(6 7
[7 8
FromBody8 @
]@ A
RegisterViewModelB S
modelT Y
)Y Z
{ 	
if 
( 

ModelState 
. 
IsValid "
)" #
{ 
var 
result 
= 
await "
userService# .
.. /
RegisterUserAsync/ @
(@ A
modelA F
)F G
;G H
if!! 
(!! 
result!! 
.!! 
	IsSuccess!! $
)!!$ %
return"" 
Ok"" 
("" 
result"" $
)""$ %
;""% &
return$$ 

BadRequest$$ !
($$! "
result$$" (
)$$( )
;$$) *
}%% 
return'' 

BadRequest'' 
('' 
$str'' =
)''= >
;''> ?
}(( 	
[** 	
HttpPost**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
CreateRolenAsync++) 9
(++9 :
[++: ;
FromBody++; C
]++C D
CreateRoleViewModel++E X
model++Y ^
)++^ _
{,, 	
if-- 
(-- 

ModelState-- 
.-- 
IsValid-- "
)--" #
{.. 
var// 
result// 
=// 
await// "
userService//# .
.//. /
CreateRoleAsync/// >
(//> ?
model//? D
)//D E
;//E F
if11 
(11 
result11 
.11 
	IsSuccess11 $
)11$ %
{22 
return33 
Ok33 
(33 
result33 $
)33$ %
;33% &
}44 
return66 

BadRequest66 !
(66! "
result66" (
)66( )
;66) *
}77 
return88 

BadRequest88 
(88 
$str88 =
)88= >
;88> ?
}99 	
[;; 	
HttpPost;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' ( 
CreateUserRolenAsync<<) =
(<<= >
[<<> ?
FromBody<<? G
]<<G H#
CreateUserRoleViewModel<<I `
model<<a f
)<<f g
{== 	
if>> 
(>> 

ModelState>> 
.>> 
IsValid>> "
)>>" #
{?? 
var@@ 
result@@ 
=@@ 
await@@ "
userService@@# .
.@@. /
CreateUserRoleAsync@@/ B
(@@B C
model@@C H
)@@H I
;@@I J
ifBB 
(BB 
resultBB 
.BB 
	IsSuccessBB $
)BB$ %
{CC 
returnDD 
OkDD 
(DD 
resultDD $
)DD$ %
;DD% &
}EE 
returnGG 

BadRequestGG !
(GG! "
resultGG" (
)GG( )
;GG) *
}HH 
returnII 

BadRequestII 
(II 
$strII =
)II= >
;II> ?
}JJ 	
[LL 	
HttpPostLL	 
(LL 
$strLL 
)LL 
]LL 
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (

LoginAsyncMM) 3
(MM3 4
[MM4 5
FromBodyMM5 =
]MM= >
LoginViewModelMM? M
modelMMN S
)MMS T
{NN 	
ifOO 
(OO 

ModelStateOO 
.OO 
IsValidOO "
)OO" #
{PP 
varQQ 
resultQQ 
=QQ 
awaitQQ "
userServiceQQ# .
.QQ. /
LoginUserAsyncQQ/ =
(QQ= >
modelQQ> C
)QQC D
;QQD E
ifSS 
(SS 
resultSS 
.SS 
	IsSuccessSS $
)SS$ %
{TT 
returnUU 
OkUU 
(UU 
resultUU $
)UU$ %
;UU% &
}VV 
returnXX 

BadRequestXX !
(XX! "
resultXX" (
)XX( )
;XX) *
}YY 
return[[ 

BadRequest[[ 
([[ 
$str[[ =
)[[= >
;[[> ?
}\\ 	
}^^ 
}__ ßR
hE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Controllers\LaboratoriesController.cs
	namespace 	
FarmaciaAPI
 
. 
Controllers !
{ 
[ 
	Authorize 
( 
) 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class "
LaboratoriesController '
:( )

Controller* 4
{ 
private 
ILaboratoryService "
_laboratoryService# 5
;5 6
private 
IFileService 
_fileService )
;) *
public "
LaboratoriesController %
(% &
ILaboratoryService& 8
laboratoryService9 J
,J K
IFileServiceL X
fileServiceY d
)d e
{ 	
_laboratoryService 
=  
laboratoryService! 2
;2 3
_fileService 
= 
fileService &
;& '
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
LaboratoryModel3 B
>B C
>C D
>D E 
GetLaboratoriesAsyncF Z
(Z [
string[ a
orderByb i
=j k
$strl p
)p q
{ 	
try   
{!! 
var"" 
laboratories""  
=""! "
await""# (
_laboratoryService"") ;
.""; < 
GetLaboratoriesAsync""< P
(""P Q
orderBy""Q X
)""X Y
;""Y Z
return## 
Ok## 
(## 
laboratories## &
)##& '
;##' (
}$$ 
catch%% 
(%% $
NotFoundElementException%% +
ex%%, .
)%%. /
{&& 
return'' 
NotFound'' 
(''  
ex''  "
.''" #
Message''# *
)''* +
;''+ ,
}(( 
catch)) 
()) ,
 InvalidElementOperationException)) 3
ex))4 6
)))6 7
{** 
return++ 

BadRequest++ !
(++! "
ex++" $
.++$ %
Message++% ,
)++, -
;++- .
},, 
catch-- 
(-- 
	Exception-- 
)-- 
{.. 
return// 

StatusCode// !
(//! "
StatusCodes//" -
.//- .(
Status500InternalServerError//. J
,//J K
$str//L `
)//` a
;//a b
}00 
}11 	
[33 	
HttpGet33	 
(33 
$str33 
)33 
]33 
public44 
async44 
Task44 
<44 
ActionResult44 &
<44& '
LaboratoryModel44' 6
>446 7
>447 8
GetLaboratoryAsync449 K
(44K L
int44L O
id44P R
)44R S
{55 	
try66 
{77 
var88 

laboratory88 
=88  
await88! &
_laboratoryService88' 9
.889 :
GetLaboratoryAsync88: L
(88L M
id88M O
)88O P
;88P Q
return99 
Ok99 
(99 

laboratory99 $
)99$ %
;99% &
}:: 
catch;; 
(;; $
NotFoundElementException;; +
ex;;, .
);;. /
{<< 
return== 
NotFound== 
(==  
ex==  "
.==" #
Message==# *
)==* +
;==+ ,
}>> 
catch?? 
(?? 
	Exception?? 
)?? 
{@@ 
returnAA 

StatusCodeAA !
(AA! "
StatusCodesAA" -
.AA- .(
Status500InternalServerErrorAA. J
,AAJ K
$strAAL `
)AA` a
;AAa b
}BB 
}CC 	
[EE 	
HttpPostEE	 
]EE 
publicFF 
asyncFF 
TaskFF 
<FF 
ActionResultFF &
<FF& '
LaboratoryModelFF' 6
>FF6 7
>FF7 8
PostLaboratoryAsyncFF9 L
(FFL M
[FFM N
FromFormFFN V
]FFV W
LaboratoryFormModelFFX k

laboratoryFFl v
)FFv w
{GG 	
tryHH 
{II 
ifJJ 
(JJ 
!JJ 

ModelStateJJ 
.JJ  
IsValidJJ  '
)JJ' (
returnKK 

BadRequestKK %
(KK% &

ModelStateKK& 0
)KK0 1
;KK1 2
varMM 
fileMM 
=MM 

laboratoryMM %
.MM% &
ImageMM& +
;MM+ ,
stringNN 
	imagePathNN  
=NN! "
_fileServiceNN# /
.NN/ 0

UploadFileNN0 :
(NN: ;
fileNN; ?
)NN? @
;NN@ A

laboratoryPP 
.PP 
	ImagePathPP $
=PP% &
	imagePathPP' 0
;PP0 1
varRR 
newLaboratoryRR !
=RR" #
awaitRR$ )
_laboratoryServiceRR* <
.RR< =!
CreateLaboratoryAsyncRR= R
(RRR S

laboratoryRRS ]
)RR] ^
;RR^ _
returnSS 
CreatedSS 
(SS 
$"SS !
$strSS! 3
{SS3 4
newLaboratorySS4 A
.SSA B
IdSSB D
}SSD E
"SSE F
,SSF G
newLaboratorySSH U
)SSU V
;SSV W
}TT 
catchUU 
(UU $
NotFoundElementExceptionUU +
exUU, .
)UU. /
{VV 
returnWW 
NotFoundWW 
(WW  
exWW  "
.WW" #
MessageWW# *
)WW* +
;WW+ ,
}XX 
catchYY 
(YY 
	ExceptionYY 
)YY 
{ZZ 
return[[ 

StatusCode[[ !
([[! "
StatusCodes[[" -
.[[- .(
Status500InternalServerError[[. J
,[[J K
$str[[L `
)[[` a
;[[a b
}\\ 
}]] 	
[__ 	

HttpDelete__	 
(__ 
$str__ (
)__( )
]__) *
public`` 
async`` 
Task`` 
<`` 
ActionResult`` &
>``& '!
DeleteLaboratoryAsync``( =
(``= >
int``> A
laboratoryId``B N
)``N O
{aa 	
trybb 
{cc 
awaitdd 
_laboratoryServicedd (
.dd( )!
DeleteLaboratoryAsyncdd) >
(dd> ?
laboratoryIddd? K
)ddK L
;ddL M
returnee 
Okee 
(ee 
)ee 
;ee 
}ff 
catchgg 
(gg $
NotFoundElementExceptiongg +
exgg, .
)gg. /
{hh 
returnii 
NotFoundii 
(ii  
exii  "
.ii" #
Messageii# *
)ii* +
;ii+ ,
}jj 
catchkk 
(kk 
	Exceptionkk 
)kk 
{ll 
returnmm 

StatusCodemm !
(mm! "
StatusCodesmm" -
.mm- .(
Status500InternalServerErrormm. J
,mmJ K
$strmmL `
)mm` a
;mma b
}nn 
}oo 	
[qq 	
HttpPutqq	 
(qq 
$strqq %
)qq% &
]qq& '
publicrr 
asyncrr 
Taskrr 
<rr 
ActionResultrr &
<rr& '
LaboratoryModelrr' 6
>rr6 7
>rr7 8
PutLaboratoryAsyncrr9 K
(rrK L
intrrL O
laboratoryIdrrP \
,rr\ ]
[rr^ _
FromFormrr_ g
]rrg h
LaboratoryFormModelrri |

laboratory	rr} á
)
rrá à
{ss 	
trytt 
{uu 
ifvv 
(vv 
!vv 

ModelStatevv 
.vv  
IsValidvv  '
)vv' (
{ww 
ifxx 
(xx 

laboratoryxx "
.xx" #
Addressxx# *
!=xx+ -
nullxx. 2
&&xx3 5

ModelStatexx6 @
.xx@ A
ContainsKeyxxA L
(xxL M
$strxxM V
)xxV W
&&xxX Z

ModelStatexx[ e
[xxe f
$strxxf o
]xxo p
.xxp q
Errorsxxq w
.xxw x
Countxxx }
>xx~ 
$num
xxÄ Å
)
xxÅ Ç
{yy 
returnzz 

BadRequestzz )
(zz) *

ModelStatezz* 4
[zz4 5
$strzz5 >
]zz> ?
.zz? @
Errorszz@ F
)zzF G
;zzG H
}{{ 
}|| 
var~~ 
file~~ 
=~~ 

laboratory~~ %
.~~% &
Image~~& +
;~~+ ,
string 
	imagePath  
=! "
_fileService# /
./ 0

UploadFile0 :
(: ;
file; ?
)? @
;@ A

laboratory
ÅÅ 
.
ÅÅ 
	ImagePath
ÅÅ $
=
ÅÅ% &
	imagePath
ÅÅ' 0
;
ÅÅ0 1
var
ÉÉ 
updatedLaboratory
ÉÉ %
=
ÉÉ& '
await
ÉÉ( - 
_laboratoryService
ÉÉ. @
.
ÉÉ@ A#
UpdateLaboratoryAsync
ÉÉA V
(
ÉÉV W
laboratoryId
ÉÉW c
,
ÉÉc d

laboratory
ÉÉe o
)
ÉÉo p
;
ÉÉp q
return
ÑÑ 
Ok
ÑÑ 
(
ÑÑ 
updatedLaboratory
ÑÑ +
)
ÑÑ+ ,
;
ÑÑ, -
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ &
NotFoundElementException
ÜÜ +
ex
ÜÜ, .
)
ÜÜ. /
{
áá 
return
àà 
NotFound
àà 
(
àà  
ex
àà  "
.
àà" #
Message
àà# *
)
àà* +
;
àà+ ,
}
ââ 
catch
ää 
(
ää 
	Exception
ää 
)
ää 
{
ãã 
return
åå 

StatusCode
åå !
(
åå! "
StatusCodes
åå" -
.
åå- .*
Status500InternalServerError
åå. J
,
ååJ K
$str
ååL `
)
åå` a
;
ååa b
}
çç 
}
éé 	
}
èè 
}êê ˜I
dE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Controllers\ProductsController.cs
	namespace 	
FarmaciaAPI
 
. 
Controllers !
{ 
[ 
Route 

(
 
$str =
)= >
]> ?
public 

class 
ProductsController #
:$ %

Controller& 0
{ 
private 
IProductService 
_productService  /
;/ 0
private 
IFileService 
_fileService )
;) *
public 
ProductsController !
(! "
IProductService" 1
productService2 @
,@ A
IFileServiceB N
fileServiceO Z
)Z [
{ 	
_productService 
= 
productService ,
;, -
_fileService 
= 
fileService &
;& '
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
IEnumerable' 2
<2 3
ProductModel3 ?
>? @
>@ A
>A B
GetProductsAsyncC S
(S T
intT W
laboratoryIdX d
)d e
{ 	
try 
{ 
return 
Ok 
( 
await 
_productService  /
./ 0
GetProductsAsync0 @
(@ A
laboratoryIdA M
)M N
)N O
;O P
} 
catch   
(   $
NotFoundElementException   +
ex  , .
)  . /
{!! 
return"" 
NotFound"" 
(""  
ex""  "
.""" #
Message""# *
)""* +
;""+ ,
}## 
catch$$ 
($$ 
	Exception$$ 
)$$ 
{%% 
return&& 

StatusCode&& !
(&&! "
StatusCodes&&" -
.&&- .(
Status500InternalServerError&&. J
,&&J K
$str&&L `
)&&` a
;&&a b
}'' 
}(( 	
[++ 	
HttpGet++	 
(++ 
$str++ "
)++" #
]++# $
public,, 
async,, 
Task,, 
<,, 
ActionResult,, &
<,,& '
ProductModel,,' 3
>,,3 4
>,,4 5
GetProductAsync,,6 E
(,,E F
int,,F I
laboratoryId,,J V
,,,V W
int,,X [
	productId,,\ e
),,e f
{-- 	
try.. 
{// 
var00 
product00 
=00 
await00 #
_productService00$ 3
.003 4
GetProductAsync004 C
(00C D
laboratoryId00D P
,00P Q
	productId00R [
)00[ \
;00\ ]
return11 
Ok11 
(11 
product11 !
)11! "
;11" #
}22 
catch33 
(33 $
NotFoundElementException33 +
ex33, .
)33. /
{44 
return55 
NotFound55 
(55  
ex55  "
.55" #
Message55# *
)55* +
;55+ ,
}66 
catch77 
(77 
	Exception77 
)77 
{88 
return99 

StatusCode99 !
(99! "
StatusCodes99" -
.99- .(
Status500InternalServerError99. J
,99J K
$str99L `
)99` a
;99a b
}:: 
};; 	
[== 	
HttpPost==	 
]== 
public>> 
async>> 
Task>> 
<>> 
ActionResult>> &
<>>& '
ProductModel>>' 3
>>>3 4
>>>4 5
PostProductAsync>>6 F
(>>F G
int>>G J
laboratoryId>>K W
,>>W X
[>>Y Z
FromForm>>Z b
]>>b c
ProductFormModel>>d t

newProduct>>u 
)	>> Ä
{?? 	
try@@ 
{AA 
ifBB 
(BB 
!BB 

ModelStateBB 
.BB  
IsValidBB  '
)BB' (
returnCC 

BadRequestCC %
(CC% &

ModelStateCC& 0
)CC0 1
;CC1 2
varDD 
fileDD 
=DD 

newProductDD %
.DD% &
ImageDD& +
;DD+ ,
stringEE 
	imagePathEE  
=EE! "
_fileServiceEE# /
.EE/ 0

UploadFileEE0 :
(EE: ;
fileEE; ?
)EE? @
;EE@ A

newProductGG 
.GG 
	ImagePathGG $
=GG% &
	imagePathGG' 0
;GG0 1
varHH 
productHH 
=HH 
awaitHH #
_productServiceHH$ 3
.HH3 4
CreateProductAsyncHH4 F
(HHF G
laboratoryIdHHG S
,HHS T

newProductHHU _
)HH_ `
;HH` a
returnII 
CreatedII 
(II 
$"II !
$strII! 3
{II3 4
productII4 ;
.II; <
LaboratoryIdII< H
}IIH I
$strIII S
{IIS T
productIIT [
.II[ \
IdII\ ^
}II^ _
"II_ `
,II` a
productIIb i
)IIi j
;IIj k
}KK 
catchLL 
(LL $
NotFoundElementExceptionLL +
exLL, .
)LL. /
{MM 
returnNN 
NotFoundNN 
(NN  
exNN  "
.NN" #
MessageNN# *
)NN* +
;NN+ ,
}OO 
catchPP 
(PP 
	ExceptionPP 
)PP 
{QQ 
returnRR 

StatusCodeRR !
(RR! "
StatusCodesRR" -
.RR- .(
Status500InternalServerErrorRR. J
,RRJ K
$strRRL `
)RR` a
;RRa b
}SS 
}TT 	
[VV 	

HttpDeleteVV	 
(VV 
$strVV !
)VV! "
]VV" #
publicWW 
asyncWW 
TaskWW 
<WW 
ActionResultWW &
>WW& '
DeleteProductAsyncWW( :
(WW: ;
intWW; >
laboratoryIdWW? K
,WWK L
intWWM P
	productIdWWQ Z
)WWZ [
{XX 	
tryYY 
{ZZ 
await[[ 
_productService[[ %
.[[% &
DeleteProductAsync[[& 8
([[8 9
laboratoryId[[9 E
,[[E F
	productId[[G P
)[[P Q
;[[Q R
return\\ 
Ok\\ 
(\\ 
)\\ 
;\\ 
}]] 
catch^^ 
(^^ $
NotFoundElementException^^ +
ex^^, .
)^^. /
{__ 
return`` 
NotFound`` 
(``  
ex``  "
.``" #
Message``# *
)``* +
;``+ ,
}aa 
catchbb 
(bb 
	Exceptionbb 
)bb 
{cc 
returndd 

StatusCodedd !
(dd! "
StatusCodesdd" -
.dd- .(
Status500InternalServerErrordd. J
,ddJ K
$strddL `
)dd` a
;dda b
}ee 
}ff 	
[hh 	
HttpPuthh	 
(hh 
$strhh 
)hh 
]hh  
publicii 
asyncii 
Taskii 
<ii 
ActionResultii &
<ii& '
ProductModelii' 3
>ii3 4
>ii4 5
UpdateProductAsyncii6 H
(iiH I
intiiI L
laboratoryIdiiM Y
,iiY Z
intii[ ^
	productIdii_ h
,iih i
[iij k
FromFormiik s
]iis t
ProductFormModel	iiu Ö
product
iiÜ ç
)
iiç é
{jj 	
trykk 
{ll 
varmm 
filemm 
=mm 
productmm "
.mm" #
Imagemm# (
;mm( )
stringnn 
	imagePathnn  
=nn! "
_fileServicenn# /
.nn/ 0

UploadFilenn0 :
(nn: ;
filenn; ?
)nn? @
;nn@ A
productpp 
.pp 
	ImagePathpp !
=pp" #
	imagePathpp$ -
;pp- .
varrr 
updatedProductrr "
=rr# $
awaitrr% *
_productServicerr+ :
.rr: ;
UpdateProductAsyncrr; M
(rrM N
laboratoryIdrrN Z
,rrZ [
	productIdrr\ e
,rre f
productrrg n
)rrn o
;rro p
returnss 
Okss 
(ss 
updatedProductss (
)ss( )
;ss) *
}tt 
catchuu 
(uu $
NotFoundElementExceptionuu +
exuu, .
)uu. /
{vv 
returnww 
NotFoundww 
(ww  
exww  "
.ww" #
Messageww# *
)ww* +
;ww+ ,
}xx 
catchyy 
(yy 
	Exceptionyy 
)yy 
{zz 
return{{ 

StatusCode{{ !
({{! "
StatusCodes{{" -
.{{- .(
Status500InternalServerError{{. J
,{{J K
$str{{L `
){{` a
;{{a b
}|| 
}}} 	
}~~ 
} ê
\E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\AutomapperProfile.cs
	namespace		 	
FarmaciaAPI		
 
.		 
Data		 
{

 
public 

class 
AutomapperProfile "
:# $
Profile% ,
{ 
public 
AutomapperProfile  
(  !
)! "
{ 	
this 
. 
	CreateMap 
< 
LaboratoryEntity +
,+ ,
LaboratoryModel- <
>< =
(= >
)> ?
. 

ReverseMap 
( 
) 
; 
this 
. 
	CreateMap 
< 
ProductEntity (
,( )
ProductModel* 6
>6 7
(7 8
)8 9
. 
	ForMember 
( 
mod 
=> !
mod" %
.% &
LaboratoryId& 2
,2 3
ent4 7
=>8 :
ent; >
.> ?
MapFrom? F
(F G
entSrcG M
=>N P
entSrcQ W
.W X

LaboratoryX b
.b c
Idc e
)e f
)f g
. 

ReverseMap 
( 
) 
. 
	ForMember 
( 
ent 
=> !
ent" %
.% &

Laboratory& 0
,0 1
mod2 5
=>6 8
mod9 <
.< =
MapFrom= D
(D E
modSrcE K
=>L N
newO R
LaboratoryEntityS c
(c d
)d e
{f g
Idh j
=k l
modSrcm s
.s t
LaboratoryId	t Ä
}
Å Ç
)
Ç É
)
É Ñ
;
Ñ Ö
} 	
} 
} ”
dE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\Entities\LaboratoryEntity.cs
	namespace 	
FarmaciaAPI
 
. 
Data 
. 
Entities #
{		 
public

 
class

 
LaboratoryEntity

 %
{ 	
[ 
Key 
] 
[ 
Required 
] 
public 
int 
Id 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Name 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Address !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Phone 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Email 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 

MakeOrders "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
	ImagePath #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
ICollection 
< 
ProductEntity ,
>, -
Products. 6
{7 8
get9 <
;< =
set> A
;A B
}C D
} 	
} Á
aE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\Entities\ProductEntity.cs
	namespace 	
FarmaciaAPI
 
. 
Data 
. 
Entities #
{		 
public

 

class

 
ProductEntity

 
{ 
[ 	
Key	 
] 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
? 
PurchasePrice %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
decimal 
? 
	SalePrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
? 
Stock 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Presentation "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TherapeuticAction '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
	ImagePath 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	

ForeignKey	 
( 
$str "
)" #
]# $
public 
virtual 
LaboratoryEntity '

Laboratory( 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
} 
} £
\E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\FarmaciaDBContext.cs
	namespace		 	
FarmaciaAPI		
 
.		 
Data		 
{

 
public 

class 
FarmaciaDBContext "
:# $
IdentityDbContext% 6
{ 
public 
DbSet 
< 
LaboratoryEntity %
>% &
Laboratories' 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public 
DbSet 
< 
ProductEntity "
>" #
Products$ ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
FarmaciaDBContext  
(  !
DbContextOptions! 1
<1 2
FarmaciaDBContext2 C
>C D
optionsE L
)L M
: 
base 
( 
options 
) 
{ 	
} 	
	protected 
override 
void 
OnModelCreating  /
(/ 0
ModelBuilder0 <
modelBuilder= I
)I J
{ 	
base 
. 
OnModelCreating  
(  !
modelBuilder! -
)- .
;. /
modelBuilder 
. 
Entity 
<  
LaboratoryEntity  0
>0 1
(1 2
)2 3
.3 4
ToTable4 ;
(; <
$str< J
)J K
;K L
modelBuilder 
. 
Entity 
<  
LaboratoryEntity  0
>0 1
(1 2
)2 3
.3 4
Property4 <
(< =
r= >
=>? A
rB C
.C D
IdD F
)F G
.G H
ValueGeneratedOnAddH [
([ \
)\ ]
;] ^
modelBuilder 
. 
Entity 
<  
LaboratoryEntity  0
>0 1
(1 2
)2 3
.3 4
HasMany4 ;
(; <
r< =
=>> @
rA B
.B C
ProductsC K
)K L
.L M
WithOneM T
(T U
dU V
=>W Y
dZ [
.[ \

Laboratory\ f
)f g
;g h
modelBuilder 
. 
Entity 
<  
ProductEntity  -
>- .
(. /
)/ 0
.0 1
ToTable1 8
(8 9
$str9 C
)C D
;D E
modelBuilder 
. 
Entity 
<  
ProductEntity  -
>- .
(. /
)/ 0
.0 1
Property1 9
(9 :
r: ;
=>< >
r? @
.@ A
IdA C
)C D
.D E
ValueGeneratedOnAddE X
(X Y
)Y Z
;Z [
modelBuilder   
.   
Entity   
<    
ProductEntity    -
>  - .
(  . /
)  / 0
.  0 1
HasOne  1 7
(  7 8
d  8 9
=>  : <
d  = >
.  > ?

Laboratory  ? I
)  I J
.  J K
WithMany  K S
(  S T
r  T U
=>  V X
r  Y Z
.  Z [
Products  [ c
)  c d
;  d e
}!! 	
}"" 
}## ü
kE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\Repository\ILaboratoryRepository.cs
	namespace 	
FarmaciaAPI
 
. 
Data 
. 

Repository %
{ 
public		 

	interface		 !
ILaboratoryRepository		 *
{

 
Task 
< 
IEnumerable 
< 
LaboratoryEntity )
>) *
>* + 
GetLaboratoriesAsync, @
(@ A
stringA G
orderByH O
)O P
;P Q
Task 
< 
LaboratoryEntity 
> 
GetLaboratoryAsync 1
(1 2
int2 5
laboratoryId6 B
)B C
;C D
void 
CreateLaboratory 
( 
LaboratoryEntity .

laboratory/ 9
)9 :
;: ;
Task !
UpdateLaboratoryAsync "
(" #
int# &
laboratoryId' 3
,3 4
LaboratoryEntity5 E

laboratoryF P
)P Q
;Q R
Task !
DeleteLaboratoryAsync "
(" #
int# &
laboratoryId' 3
)3 4
;4 5
Task 
< 
IEnumerable 
< 
ProductEntity &
>& '
>' (
GetProductsAsync) 9
(9 :
int: =
laboratoryId> J
)J K
;K L
Task 
< 
ProductEntity 
> 
GetProductAsync +
(+ ,
int, /
laboratoryId0 <
,< =
int> A
	productIdB K
)K L
;L M
void 
CreateProduct 
( 
int 
laboratoryId +
,+ ,
ProductEntity- :
product; B
)B C
;C D
Task 
DeleteProductAsync 
(  
int  #
laboratoryId$ 0
,0 1
int2 5
	productId6 ?
)? @
;@ A
Task 
UpdateProductAsync 
(  
int  #
laboratoryId$ 0
,0 1
int2 5
	productId6 ?
,? @
ProductEntityA N
productO V
)V W
;W X
Task 
< 
bool 
> 
SaveChangesAsync #
(# $
)$ %
;% &
} 
} „t
jE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Data\Repository\LaboratoryRepository.cs
	namespace 	
FarmaciaAPI
 
. 
Data 
. 

Repository %
{		 
public

 

class

  
LaboratoryRepository

 %
:

& '!
ILaboratoryRepository

( =
{ 
private 
FarmaciaDBContext !

_dbContext" ,
;, -
public  
LaboratoryRepository #
(# $
FarmaciaDBContext$ 5
	dbContext6 ?
)? @
{ 	

_dbContext 
= 
	dbContext "
;" #
} 	
public 
void 
CreateLaboratory $
($ %
LaboratoryEntity% 5

laboratory6 @
)@ A
{ 	

_dbContext 
. 
Laboratories #
.# $
Add$ '
(' (

laboratory( 2
)2 3
;3 4
} 	
public 
void 
CreateProduct !
(! "
int" %
laboratoryId& 2
,2 3
ProductEntity4 A
productB I
)I J
{ 	

_dbContext 
. 
Entry 
( 
product $
.$ %

Laboratory% /
)/ 0
.0 1
State1 6
=7 8
EntityState9 D
.D E
	UnchangedE N
;N O

_dbContext 
. 
Products 
.  
Add  #
(# $
product$ +
)+ ,
;, -
} 	
public 
async 
Task !
DeleteLaboratoryAsync 0
(0 1
int1 4
laboratoryId5 A
)A B
{ 	
var 
laboratoryToDelete "
=# $
await% *

_dbContext+ 5
.5 6
Laboratories6 B
.B C 
SingleOrDefaultAsyncC W
(W X
rX Y
=>Z \
r] ^
.^ _
Id_ a
==b d
laboratoryIde q
)q r
;r s

_dbContext 
. 
Laboratories #
.# $
Remove$ *
(* +
laboratoryToDelete+ =
)= >
;> ?
}   	
public"" 
async"" 
Task"" 
DeleteProductAsync"" ,
("", -
int""- 0
laboratoryId""1 =
,""= >
int""? B
	productId""C L
)""L M
{## 	
var$$ 
productToDelete$$ 
=$$  !
await$$" '

_dbContext$$( 2
.$$2 3
Products$$3 ;
.$$; <
FirstOrDefaultAsync$$< O
($$O P
d$$P Q
=>$$R T
d$$U V
.$$V W

Laboratory$$W a
.$$a b
Id$$b d
==$$e g
laboratoryId$$h t
&&$$u w
d$$x y
.$$y z
Id$$z |
==$$} 
	productId
$$Ä â
)
$$â ä
;
$$ä ã

_dbContext%% 
.%% 
Products%% 
.%%  
Remove%%  &
(%%& '
productToDelete%%' 6
)%%6 7
;%%7 8
}&& 	
public(( 
async(( 
Task(( 
<(( 
IEnumerable(( %
<((% &
LaboratoryEntity((& 6
>((6 7
>((7 8 
GetLaboratoriesAsync((9 M
(((M N
string((N T
orderBy((U \
)((\ ]
{)) 	

IQueryable** 
<** 
LaboratoryEntity** '
>**' (
query**) .
=**/ 0

_dbContext**1 ;
.**; <
Laboratories**< H
;**H I
query++ 
=++ 
query++ 
.++ 
AsNoTracking++ &
(++& '
)++' (
;++( )
switch-- 
(-- 
orderBy-- 
.-- 
ToLower-- #
(--# $
)--$ %
)--% &
{.. 
case// 
$str// 
:// 
query00 
=00 
query00 !
.00! "
OrderBy00" )
(00) *
r00* +
=>00, .
r00/ 0
.000 1
Id001 3
)003 4
;004 5
break11 
;11 
case22 
$str22 
:22 
query33 
=33 
query33 !
.33! "
OrderBy33" )
(33) *
r33* +
=>33, .
r33/ 0
.330 1
Name331 5
)335 6
;336 7
break44 
;44 
case55 
$str55 
:55 
query66 
=66 
query66 !
.66! "
OrderBy66" )
(66) *
r66* +
=>66, .
r66/ 0
.660 1
Address661 8
)668 9
;669 :
break77 
;77 
case88 
$str88 
:88 
query99 
=99 
query99 !
.99! "
OrderBy99" )
(99) *
r99* +
=>99, .
r99/ 0
.990 1
Phone991 6
)996 7
;997 8
break:: 
;:: 
case;; 
$str;; 
:;; 
query<< 
=<< 
query<< !
.<<! "
OrderBy<<" )
(<<) *
r<<* +
=><<, .
r<</ 0
.<<0 1
Email<<1 6
)<<6 7
;<<7 8
break== 
;== 
case>> 
$str>> !
:>>! "
query?? 
=?? 
query?? !
.??! "
OrderBy??" )
(??) *
r??* +
=>??, .
r??/ 0
.??0 1

MakeOrders??1 ;
)??; <
;??< =
break@@ 
;@@ 
defaultAA 
:AA 
queryBB 
=BB 
queryBB !
.BB! "
OrderByBB" )
(BB) *
rBB* +
=>BB, .
rBB/ 0
.BB0 1
IdBB1 3
)BB3 4
;BB4 5
breakCC 
;CC 
}DD 
varFF 
resultFF 
=FF 
awaitFF 
queryFF $
.FF$ %
ToListAsyncFF% 0
(FF0 1
)FF1 2
;FF2 3
returnHH 
resultHH 
;HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
LaboratoryEntityKK *
>KK* +
GetLaboratoryAsyncKK, >
(KK> ?
intKK? B
laboratoryIdKKC O
)KKO P
{LL 	

IQueryableMM 
<MM 
LaboratoryEntityMM '
>MM' (
queryMM) .
=MM/ 0

_dbContextMM1 ;
.MM; <
LaboratoriesMM< H
;MMH I
queryNN 
=NN 
queryNN 
.NN 
AsNoTrackingNN &
(NN& '
)NN' (
;NN( )
returnOO 
awaitOO 
queryOO 
.OO 
FirstOrDefaultAsyncOO 2
(OO2 3
rOO3 4
=>OO5 7
rOO8 9
.OO9 :
IdOO: <
==OO= ?
laboratoryIdOO@ L
)OOL M
;OOM N
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
ProductEntityRR '
>RR' (
GetProductAsyncRR) 8
(RR8 9
intRR9 <
laboratoryIdRR= I
,RRI J
intRRK N
	productIdRRO X
)RRX Y
{SS 	

IQueryableTT 
<TT 
ProductEntityTT $
>TT$ %
queryTT& +
=TT, -

_dbContextTT. 8
.TT8 9
ProductsTT9 A
;TTA B
queryUU 
=UU 
queryUU 
.UU 
AsNoTrackingUU &
(UU& '
)UU' (
;UU( )
returnVV 
awaitVV 
queryVV 
.VV 
FirstOrDefaultAsyncVV 2
(VV2 3
dVV3 4
=>VV5 7
dVV8 9
.VV9 :
IdVV: <
==VV= ?
	productIdVV@ I
&&VVJ L
dVVM N
.VVN O

LaboratoryVVO Y
.VVY Z
IdVVZ \
==VV] _
laboratoryIdVV` l
)VVl m
;VVm n
}WW 	
publicYY 
asyncYY 
TaskYY 
<YY 
IEnumerableYY %
<YY% &
ProductEntityYY& 3
>YY3 4
>YY4 5
GetProductsAsyncYY6 F
(YYF G
intYYG J
laboratoryIdYYK W
)YYW X
{ZZ 	

IQueryable[[ 
<[[ 
ProductEntity[[ $
>[[$ %
query[[& +
=[[, -

_dbContext[[. 8
.[[8 9
Products[[9 A
;[[A B
query\\ 
=\\ 
query\\ 
.\\ 
AsNoTracking\\ &
(\\& '
)\\' (
;\\( )
query]] 
=]] 
query]] 
.]] 
Where]] 
(]]  
d]]  !
=>]]" $
d]]% &
.]]& '

Laboratory]]' 1
.]]1 2
Id]]2 4
==]]5 7
laboratoryId]]8 D
)]]D E
;]]E F
return^^ 
await^^ 
query^^ 
.^^ 
ToListAsync^^ *
(^^* +
)^^+ ,
;^^, -
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
boolaa 
>aa 
SaveChangesAsyncaa  0
(aa0 1
)aa1 2
{bb 	
trycc 
{dd 
varee 
resultee 
=ee 
awaitee "

_dbContextee# -
.ee- .
SaveChangesAsyncee. >
(ee> ?
)ee? @
;ee@ A
returnff 
resultff 
>ff 
$numff  !
?ff" #
trueff$ (
:ff) *
falseff+ 0
;ff0 1
}hh 
catchii 
(ii 
	Exceptionii 
exii 
)ii  
{jj 
throwkk 
exkk 
;kk 
}ll 
}mm 	
publicoo 
asyncoo 
Taskoo !
UpdateLaboratoryAsyncoo 0
(oo0 1
intoo1 4
laboratoryIdoo5 A
,ooA B
LaboratoryEntityooC S

laboratoryooT ^
)oo^ _
{pp 	
varqq 
laboratoryToUpdateqq "
=qq# $
awaitqq% *

_dbContextqq+ 5
.qq5 6
Laboratoriesqq6 B
.qqB C

FirstAsyncqqC M
(qqM N
rqqN O
=>qqP R
rqqS T
.qqT U
IdqqU W
==qqX Z
laboratoryIdqq[ g
)qqg h
;qqh i
laboratoryToUpdatess 
.ss 
Namess #
=ss$ %

laboratoryss& 0
.ss0 1
Namess1 5
??ss6 8
laboratoryToUpdatess9 K
.ssK L
NamessL P
;ssP Q
laboratoryToUpdatett 
.tt 
Addresstt &
=tt' (

laboratorytt) 3
.tt3 4
Addresstt4 ;
??tt< >
laboratoryToUpdatett? Q
.ttQ R
AddressttR Y
;ttY Z
laboratoryToUpdateuu 
.uu 
Phoneuu $
=uu% &

laboratoryuu' 1
.uu1 2
Phoneuu2 7
??uu8 :
laboratoryToUpdateuu; M
.uuM N
PhoneuuN S
;uuS T
laboratoryToUpdatevv 
.vv 
Emailvv $
=vv% &

laboratoryvv' 1
.vv1 2
Emailvv2 7
??vv8 :
laboratoryToUpdatevv; M
.vvM N
EmailvvN S
;vvS T
laboratoryToUpdateww 
.ww 

MakeOrdersww )
=ww* +

laboratoryww, 6
.ww6 7

MakeOrdersww7 A
??wwB D
laboratoryToUpdatewwE W
.wwW X

MakeOrderswwX b
;wwb c
laboratoryToUpdatexx 
.xx 
	ImagePathxx (
=xx) *

laboratoryxx+ 5
.xx5 6
	ImagePathxx6 ?
??xx@ B
laboratoryToUpdatexxC U
.xxU V
	ImagePathxxV _
;xx_ `
}yy 	
public{{ 
async{{ 
Task{{ 
UpdateProductAsync{{ ,
({{, -
int{{- 0
laboratoryId{{1 =
,{{= >
int{{? B
	productId{{C L
,{{L M
ProductEntity{{N [
product{{\ c
){{c d
{|| 	
var~~ 
productToUpdate~~ 
=~~  !
await~~" '

_dbContext~~( 2
.~~2 3
Products~~3 ;
.~~; <
FirstOrDefaultAsync~~< O
(~~O P
d~~P Q
=>~~R T
d~~U V
.~~V W
Id~~W Y
==~~Z \
	productId~~] f
&&~~g i
d~~j k
.~~k l

Laboratory~~l v
.~~v w
Id~~w y
==~~z |
laboratoryId	~~} â
)
~~â ä
;
~~ä ã
productToUpdate 
. 
Name  
=! "
product# *
.* +
Name+ /
??0 2
productToUpdate3 B
.B C
NameC G
;G H
productToUpdate
ÄÄ 
.
ÄÄ 
PurchasePrice
ÄÄ )
=
ÄÄ* +
product
ÄÄ, 3
.
ÄÄ3 4
PurchasePrice
ÄÄ4 A
??
ÄÄB D
productToUpdate
ÄÄE T
.
ÄÄT U
PurchasePrice
ÄÄU b
;
ÄÄb c
productToUpdate
ÅÅ 
.
ÅÅ 
	SalePrice
ÅÅ %
=
ÅÅ& '
product
ÅÅ( /
.
ÅÅ/ 0
	SalePrice
ÅÅ0 9
??
ÅÅ: <
productToUpdate
ÅÅ= L
.
ÅÅL M
	SalePrice
ÅÅM V
;
ÅÅV W
productToUpdate
ÇÇ 
.
ÇÇ 
Stock
ÇÇ !
=
ÇÇ" #
product
ÇÇ$ +
.
ÇÇ+ ,
Stock
ÇÇ, 1
??
ÇÇ2 4
productToUpdate
ÇÇ5 D
.
ÇÇD E
Stock
ÇÇE J
;
ÇÇJ K
productToUpdate
ÉÉ 
.
ÉÉ 
Presentation
ÉÉ (
=
ÉÉ) *
product
ÉÉ+ 2
.
ÉÉ2 3
Presentation
ÉÉ3 ?
??
ÉÉ@ B
productToUpdate
ÉÉC R
.
ÉÉR S
Presentation
ÉÉS _
;
ÉÉ_ `
productToUpdate
ÑÑ 
.
ÑÑ 
TherapeuticAction
ÑÑ -
=
ÑÑ. /
product
ÑÑ0 7
.
ÑÑ7 8
TherapeuticAction
ÑÑ8 I
??
ÑÑJ L
productToUpdate
ÑÑM \
.
ÑÑ\ ]
TherapeuticAction
ÑÑ] n
;
ÑÑn o
productToUpdate
ÖÖ 
.
ÖÖ 
	ImagePath
ÖÖ %
=
ÖÖ& '
product
ÖÖ( /
.
ÖÖ/ 0
	ImagePath
ÖÖ0 9
??
ÖÖ: <
productToUpdate
ÖÖ= L
.
ÖÖL M
	ImagePath
ÖÖM V
;
ÖÖV W
}
ÜÜ 	
}
áá 
}àà ˆ
qE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Exceptions\InvalidElementOperationException.cs
	namespace 	
FarmaciaAPI
 
. 

Exceptions  
{ 
public 

class ,
 InvalidElementOperationException 1
:2 3
	Exception4 =
{		 
public

 ,
 InvalidElementOperationException

 /
(

/ 0
string

0 6
message

7 >
)

> ?
:

@ A
base

B F
(

F G
message

G N
)

N O
{ 	
} 	
} 
} ﬁ
iE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Exceptions\NotFoundElementException.cs
	namespace 	
FarmaciaAPI
 
. 

Exceptions  
{ 
public 

class $
NotFoundElementException )
:* +
	Exception, 5
{		 
public

 $
NotFoundElementException

 '
(

' (
string

( .
message

/ 6
)

6 7
: 
base 
( 
message 
) 
{ 	
} 	
} 
} ¥<
pE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Migrations\20211226011637_InitialMigration.cs
	namespace 	
FarmaciaAPI
 
. 

Migrations  
{ 
public 

partial 
class 
InitialMigration )
:* +
	Migration, 5
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
CreateTable		 (
(		( )
name

 
:

 
$str

 $
,

$ %
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 6
,6 7
nullable8 @
:@ A
falseB G
)G H
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
nullableG O
:O P
trueQ U
)U V
,V W
Address 
= 
table #
.# $
Column$ *
<* +
string+ 1
>1 2
(2 3
type3 7
:7 8
$str9 H
,H I
nullableJ R
:R S
trueT X
)X Y
,Y Z
Phone 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
nullableH P
:P Q
trueR V
)V W
,W X
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
nullableH P
:P Q
trueR V
)V W
,W X

MakeOrders 
=  
table! &
.& '
Column' -
<- .
int. 1
>1 2
(2 3
type3 7
:7 8
$str9 >
,> ?
nullable@ H
:H I
trueJ N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 6
,6 7
x8 9
=>: <
x= >
.> ?
Id? A
)A B
;B C
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 6
,6 7
nullable8 @
:@ A
falseB G
)G H
. 

Annotation #
(# $
$str$ 8
,8 9
$str: @
)@ A
,A B
Name   
=   
table    
.    !
Column  ! '
<  ' (
string  ( .
>  . /
(  / 0
type  0 4
:  4 5
$str  6 E
,  E F
nullable  G O
:  O P
true  Q U
)  U V
,  V W
PurchasePrice!! !
=!!" #
table!!$ )
.!!) *
Column!!* 0
<!!0 1
decimal!!1 8
>!!8 9
(!!9 :
type!!: >
:!!> ?
$str!!@ O
,!!O P
nullable!!Q Y
:!!Y Z
true!![ _
)!!_ `
,!!` a
	SalePrice"" 
="" 
table""  %
.""% &
Column""& ,
<"", -
decimal""- 4
>""4 5
(""5 6
type""6 :
:"": ;
$str""< K
,""K L
nullable""M U
:""U V
true""W [
)""[ \
,""\ ]
Stock## 
=## 
table## !
.##! "
Column##" (
<##( )
int##) ,
>##, -
(##- .
type##. 2
:##2 3
$str##4 9
,##9 :
nullable##; C
:##C D
true##E I
)##I J
,##J K
Presentation$$  
=$$! "
table$$# (
.$$( )
Column$$) /
<$$/ 0
string$$0 6
>$$6 7
($$7 8
type$$8 <
:$$< =
$str$$> M
,$$M N
nullable$$O W
:$$W X
true$$Y ]
)$$] ^
,$$^ _
TherapeuticAction%% %
=%%& '
table%%( -
.%%- .
Column%%. 4
<%%4 5
string%%5 ;
>%%; <
(%%< =
type%%= A
:%%A B
$str%%C R
,%%R S
nullable%%T \
:%%\ ]
true%%^ b
)%%b c
,%%c d
LaboratoryId&&  
=&&! "
table&&# (
.&&( )
Column&&) /
<&&/ 0
int&&0 3
>&&3 4
(&&4 5
type&&5 9
:&&9 :
$str&&; @
,&&@ A
nullable&&B J
:&&J K
true&&L P
)&&P Q
}'' 
,'' 
constraints(( 
:(( 
table(( "
=>((# %
{)) 
table** 
.** 

PrimaryKey** $
(**$ %
$str**% 2
,**2 3
x**4 5
=>**6 8
x**9 :
.**: ;
Id**; =
)**= >
;**> ?
table++ 
.++ 

ForeignKey++ $
(++$ %
name,, 
:,, 
$str,, E
,,,E F
column-- 
:-- 
x--  !
=>--" $
x--% &
.--& '
LaboratoryId--' 3
,--3 4
principalTable.. &
:..& '
$str..( 6
,..6 7
principalColumn// '
://' (
$str//) -
,//- .
onDelete00  
:00  !
ReferentialAction00" 3
.003 4
Restrict004 <
)00< =
;00= >
}11 
)11 
;11 
migrationBuilder33 
.33 
CreateIndex33 (
(33( )
name44 
:44 
$str44 0
,440 1
table55 
:55 
$str55 !
,55! "
column66 
:66 
$str66 &
)66& '
;66' (
}77 	
	protected99 
override99 
void99 
Down99  $
(99$ %
MigrationBuilder99% 5
migrationBuilder996 F
)99F G
{:: 	
migrationBuilder;; 
.;; 
	DropTable;; &
(;;& '
name<< 
:<< 
$str<<  
)<<  !
;<<! "
migrationBuilder>> 
.>> 
	DropTable>> &
(>>& '
name?? 
:?? 
$str?? $
)??$ %
;??% &
}@@ 	
}AA 
}BB º≈
hE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Migrations\20211226224225_Security.cs
	namespace 	
FarmaciaAPI
 
. 

Migrations  
{ 
public 

partial 
class 
Security !
:" #
	Migration$ -
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{		 	
migrationBuilder

 
.

 
CreateTable

 (
(

( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 E
,E F
	maxLengthG P
:P Q
$numR U
,U V
nullableW _
:_ `
truea e
)e f
,f g
NormalizedName "
=# $
table% *
.* +
Column+ 1
<1 2
string2 8
>8 9
(9 :
type: >
:> ?
$str@ O
,O P
	maxLengthQ Z
:Z [
$num\ _
,_ `
nullablea i
:i j
truek o
)o p
,p q
ConcurrencyStamp $
=% &
table' ,
., -
Column- 3
<3 4
string4 :
>: ;
(; <
type< @
:@ A
$strB Q
,Q R
nullableS [
:[ \
true] a
)a b
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
Id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
string& ,
>, -
(- .
type. 2
:2 3
$str4 C
,C D
nullableE M
:M N
falseO T
)T U
,U V
UserName 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: I
,I J
	maxLengthK T
:T U
$numV Y
,Y Z
nullable[ c
:c d
truee i
)i j
,j k
NormalizedUserName &
=' (
table) .
.. /
Column/ 5
<5 6
string6 <
>< =
(= >
type> B
:B C
$strD S
,S T
	maxLengthU ^
:^ _
$num` c
,c d
nullablee m
:m n
trueo s
)s t
,t u
Email 
= 
table !
.! "
Column" (
<( )
string) /
>/ 0
(0 1
type1 5
:5 6
$str7 F
,F G
	maxLengthH Q
:Q R
$numS V
,V W
nullableX `
:` a
trueb f
)f g
,g h
NormalizedEmail   #
=  $ %
table  & +
.  + ,
Column  , 2
<  2 3
string  3 9
>  9 :
(  : ;
type  ; ?
:  ? @
$str  A P
,  P Q
	maxLength  R [
:  [ \
$num  ] `
,  ` a
nullable  b j
:  j k
true  l p
)  p q
,  q r
EmailConfirmed!! "
=!!# $
table!!% *
.!!* +
Column!!+ 1
<!!1 2
bool!!2 6
>!!6 7
(!!7 8
type!!8 <
:!!< =
$str!!> C
,!!C D
nullable!!E M
:!!M N
false!!O T
)!!T U
,!!U V
PasswordHash""  
=""! "
table""# (
.""( )
Column"") /
<""/ 0
string""0 6
>""6 7
(""7 8
type""8 <
:""< =
$str""> M
,""M N
nullable""O W
:""W X
true""Y ]
)""] ^
,""^ _
SecurityStamp## !
=##" #
table##$ )
.##) *
Column##* 0
<##0 1
string##1 7
>##7 8
(##8 9
type##9 =
:##= >
$str##? N
,##N O
nullable##P X
:##X Y
true##Z ^
)##^ _
,##_ `
ConcurrencyStamp$$ $
=$$% &
table$$' ,
.$$, -
Column$$- 3
<$$3 4
string$$4 :
>$$: ;
($$; <
type$$< @
:$$@ A
$str$$B Q
,$$Q R
nullable$$S [
:$$[ \
true$$] a
)$$a b
,$$b c
PhoneNumber%% 
=%%  !
table%%" '
.%%' (
Column%%( .
<%%. /
string%%/ 5
>%%5 6
(%%6 7
type%%7 ;
:%%; <
$str%%= L
,%%L M
nullable%%N V
:%%V W
true%%X \
)%%\ ]
,%%] ^ 
PhoneNumberConfirmed&& (
=&&) *
table&&+ 0
.&&0 1
Column&&1 7
<&&7 8
bool&&8 <
>&&< =
(&&= >
type&&> B
:&&B C
$str&&D I
,&&I J
nullable&&K S
:&&S T
false&&U Z
)&&Z [
,&&[ \
TwoFactorEnabled'' $
=''% &
table''' ,
.'', -
Column''- 3
<''3 4
bool''4 8
>''8 9
(''9 :
type'': >
:''> ?
$str''@ E
,''E F
nullable''G O
:''O P
false''Q V
)''V W
,''W X

LockoutEnd(( 
=((  
table((! &
.((& '
Column((' -
<((- .
DateTimeOffset((. <
>((< =
(((= >
type((> B
:((B C
$str((D T
,((T U
nullable((V ^
:((^ _
true((` d
)((d e
,((e f
LockoutEnabled)) "
=))# $
table))% *
.))* +
Column))+ 1
<))1 2
bool))2 6
>))6 7
())7 8
type))8 <
:))< =
$str))> C
,))C D
nullable))E M
:))M N
false))O T
)))T U
,))U V
AccessFailedCount** %
=**& '
table**( -
.**- .
Column**. 4
<**4 5
int**5 8
>**8 9
(**9 :
type**: >
:**> ?
$str**@ E
,**E F
nullable**G O
:**O P
false**Q V
)**V W
}++ 
,++ 
constraints,, 
:,, 
table,, "
=>,,# %
{-- 
table.. 
... 

PrimaryKey.. $
(..$ %
$str..% 5
,..5 6
x..7 8
=>..9 ;
x..< =
...= >
Id..> @
)..@ A
;..A B
}// 
)// 
;// 
migrationBuilder11 
.11 
CreateTable11 (
(11( )
name22 
:22 
$str22 (
,22( )
columns33 
:33 
table33 
=>33 !
new33" %
{44 
Id55 
=55 
table55 
.55 
Column55 %
<55% &
int55& )
>55) *
(55* +
type55+ /
:55/ 0
$str551 6
,556 7
nullable558 @
:55@ A
false55B G
)55G H
.66 

Annotation66 #
(66# $
$str66$ 8
,668 9
$str66: @
)66@ A
,66A B
RoleId77 
=77 
table77 "
.77" #
Column77# )
<77) *
string77* 0
>770 1
(771 2
type772 6
:776 7
$str778 G
,77G H
nullable77I Q
:77Q R
false77S X
)77X Y
,77Y Z
	ClaimType88 
=88 
table88  %
.88% &
Column88& ,
<88, -
string88- 3
>883 4
(884 5
type885 9
:889 :
$str88; J
,88J K
nullable88L T
:88T U
true88V Z
)88Z [
,88[ \

ClaimValue99 
=99  
table99! &
.99& '
Column99' -
<99- .
string99. 4
>994 5
(995 6
type996 :
:99: ;
$str99< K
,99K L
nullable99M U
:99U V
true99W [
)99[ \
}:: 
,:: 
constraints;; 
:;; 
table;; "
=>;;# %
{<< 
table== 
.== 

PrimaryKey== $
(==$ %
$str==% :
,==: ;
x==< =
=>==> @
x==A B
.==B C
Id==C E
)==E F
;==F G
table>> 
.>> 

ForeignKey>> $
(>>$ %
name?? 
:?? 
$str?? F
,??F G
column@@ 
:@@ 
x@@  !
=>@@" $
x@@% &
.@@& '
RoleId@@' -
,@@- .
principalTableAA &
:AA& '
$strAA( 5
,AA5 6
principalColumnBB '
:BB' (
$strBB) -
,BB- .
onDeleteCC  
:CC  !
ReferentialActionCC" 3
.CC3 4
CascadeCC4 ;
)CC; <
;CC< =
}DD 
)DD 
;DD 
migrationBuilderFF 
.FF 
CreateTableFF (
(FF( )
nameGG 
:GG 
$strGG (
,GG( )
columnsHH 
:HH 
tableHH 
=>HH !
newHH" %
{II 
IdJJ 
=JJ 
tableJJ 
.JJ 
ColumnJJ %
<JJ% &
intJJ& )
>JJ) *
(JJ* +
typeJJ+ /
:JJ/ 0
$strJJ1 6
,JJ6 7
nullableJJ8 @
:JJ@ A
falseJJB G
)JJG H
.KK 

AnnotationKK #
(KK# $
$strKK$ 8
,KK8 9
$strKK: @
)KK@ A
,KKA B
UserIdLL 
=LL 
tableLL "
.LL" #
ColumnLL# )
<LL) *
stringLL* 0
>LL0 1
(LL1 2
typeLL2 6
:LL6 7
$strLL8 G
,LLG H
nullableLLI Q
:LLQ R
falseLLS X
)LLX Y
,LLY Z
	ClaimTypeMM 
=MM 
tableMM  %
.MM% &
ColumnMM& ,
<MM, -
stringMM- 3
>MM3 4
(MM4 5
typeMM5 9
:MM9 :
$strMM; J
,MMJ K
nullableMML T
:MMT U
trueMMV Z
)MMZ [
,MM[ \

ClaimValueNN 
=NN  
tableNN! &
.NN& '
ColumnNN' -
<NN- .
stringNN. 4
>NN4 5
(NN5 6
typeNN6 :
:NN: ;
$strNN< K
,NNK L
nullableNNM U
:NNU V
trueNNW [
)NN[ \
}OO 
,OO 
constraintsPP 
:PP 
tablePP "
=>PP# %
{QQ 
tableRR 
.RR 

PrimaryKeyRR $
(RR$ %
$strRR% :
,RR: ;
xRR< =
=>RR> @
xRRA B
.RRB C
IdRRC E
)RRE F
;RRF G
tableSS 
.SS 

ForeignKeySS $
(SS$ %
nameTT 
:TT 
$strTT F
,TTF G
columnUU 
:UU 
xUU  !
=>UU" $
xUU% &
.UU& '
UserIdUU' -
,UU- .
principalTableVV &
:VV& '
$strVV( 5
,VV5 6
principalColumnWW '
:WW' (
$strWW) -
,WW- .
onDeleteXX  
:XX  !
ReferentialActionXX" 3
.XX3 4
CascadeXX4 ;
)XX; <
;XX< =
}YY 
)YY 
;YY 
migrationBuilder[[ 
.[[ 
CreateTable[[ (
([[( )
name\\ 
:\\ 
$str\\ (
,\\( )
columns]] 
:]] 
table]] 
=>]] !
new]]" %
{^^ 
LoginProvider__ !
=__" #
table__$ )
.__) *
Column__* 0
<__0 1
string__1 7
>__7 8
(__8 9
type__9 =
:__= >
$str__? N
,__N O
nullable__P X
:__X Y
false__Z _
)___ `
,__` a
ProviderKey`` 
=``  !
table``" '
.``' (
Column``( .
<``. /
string``/ 5
>``5 6
(``6 7
type``7 ;
:``; <
$str``= L
,``L M
nullable``N V
:``V W
false``X ]
)``] ^
,``^ _
ProviderDisplayNameaa '
=aa( )
tableaa* /
.aa/ 0
Columnaa0 6
<aa6 7
stringaa7 =
>aa= >
(aa> ?
typeaa? C
:aaC D
$straaE T
,aaT U
nullableaaV ^
:aa^ _
trueaa` d
)aad e
,aae f
UserIdbb 
=bb 
tablebb "
.bb" #
Columnbb# )
<bb) *
stringbb* 0
>bb0 1
(bb1 2
typebb2 6
:bb6 7
$strbb8 G
,bbG H
nullablebbI Q
:bbQ R
falsebbS X
)bbX Y
}cc 
,cc 
constraintsdd 
:dd 
tabledd "
=>dd# %
{ee 
tableff 
.ff 

PrimaryKeyff $
(ff$ %
$strff% :
,ff: ;
xff< =
=>ff> @
newffA D
{ffE F
xffG H
.ffH I
LoginProviderffI V
,ffV W
xffX Y
.ffY Z
ProviderKeyffZ e
}fff g
)ffg h
;ffh i
tablegg 
.gg 

ForeignKeygg $
(gg$ %
namehh 
:hh 
$strhh F
,hhF G
columnii 
:ii 
xii  !
=>ii" $
xii% &
.ii& '
UserIdii' -
,ii- .
principalTablejj &
:jj& '
$strjj( 5
,jj5 6
principalColumnkk '
:kk' (
$strkk) -
,kk- .
onDeletell  
:ll  !
ReferentialActionll" 3
.ll3 4
Cascadell4 ;
)ll; <
;ll< =
}mm 
)mm 
;mm 
migrationBuilderoo 
.oo 
CreateTableoo (
(oo( )
namepp 
:pp 
$strpp '
,pp' (
columnsqq 
:qq 
tableqq 
=>qq !
newqq" %
{rr 
UserIdss 
=ss 
tabless "
.ss" #
Columnss# )
<ss) *
stringss* 0
>ss0 1
(ss1 2
typess2 6
:ss6 7
$strss8 G
,ssG H
nullablessI Q
:ssQ R
falsessS X
)ssX Y
,ssY Z
RoleIdtt 
=tt 
tablett "
.tt" #
Columntt# )
<tt) *
stringtt* 0
>tt0 1
(tt1 2
typett2 6
:tt6 7
$strtt8 G
,ttG H
nullablettI Q
:ttQ R
falsettS X
)ttX Y
}uu 
,uu 
constraintsvv 
:vv 
tablevv "
=>vv# %
{ww 
tablexx 
.xx 

PrimaryKeyxx $
(xx$ %
$strxx% 9
,xx9 :
xxx; <
=>xx= ?
newxx@ C
{xxD E
xxxF G
.xxG H
UserIdxxH N
,xxN O
xxxP Q
.xxQ R
RoleIdxxR X
}xxY Z
)xxZ [
;xx[ \
tableyy 
.yy 

ForeignKeyyy $
(yy$ %
namezz 
:zz 
$strzz E
,zzE F
column{{ 
:{{ 
x{{  !
=>{{" $
x{{% &
.{{& '
RoleId{{' -
,{{- .
principalTable|| &
:||& '
$str||( 5
,||5 6
principalColumn}} '
:}}' (
$str}}) -
,}}- .
onDelete~~  
:~~  !
ReferentialAction~~" 3
.~~3 4
Cascade~~4 ;
)~~; <
;~~< =
table 
. 

ForeignKey $
($ %
name
ÄÄ 
:
ÄÄ 
$str
ÄÄ E
,
ÄÄE F
column
ÅÅ 
:
ÅÅ 
x
ÅÅ  !
=>
ÅÅ" $
x
ÅÅ% &
.
ÅÅ& '
UserId
ÅÅ' -
,
ÅÅ- .
principalTable
ÇÇ &
:
ÇÇ& '
$str
ÇÇ( 5
,
ÇÇ5 6
principalColumn
ÉÉ '
:
ÉÉ' (
$str
ÉÉ) -
,
ÉÉ- .
onDelete
ÑÑ  
:
ÑÑ  !
ReferentialAction
ÑÑ" 3
.
ÑÑ3 4
Cascade
ÑÑ4 ;
)
ÑÑ; <
;
ÑÑ< =
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 
migrationBuilder
áá 
.
áá 
CreateTable
áá (
(
áá( )
name
àà 
:
àà 
$str
àà (
,
àà( )
columns
ââ 
:
ââ 
table
ââ 
=>
ââ !
new
ââ" %
{
ää 
UserId
ãã 
=
ãã 
table
ãã "
.
ãã" #
Column
ãã# )
<
ãã) *
string
ãã* 0
>
ãã0 1
(
ãã1 2
type
ãã2 6
:
ãã6 7
$str
ãã8 G
,
ããG H
nullable
ããI Q
:
ããQ R
false
ããS X
)
ããX Y
,
ããY Z
LoginProvider
åå !
=
åå" #
table
åå$ )
.
åå) *
Column
åå* 0
<
åå0 1
string
åå1 7
>
åå7 8
(
åå8 9
type
åå9 =
:
åå= >
$str
åå? N
,
ååN O
nullable
ååP X
:
ååX Y
false
ååZ _
)
åå_ `
,
åå` a
Name
çç 
=
çç 
table
çç  
.
çç  !
Column
çç! '
<
çç' (
string
çç( .
>
çç. /
(
çç/ 0
type
çç0 4
:
çç4 5
$str
çç6 E
,
ççE F
nullable
ççG O
:
ççO P
false
ççQ V
)
ççV W
,
ççW X
Value
éé 
=
éé 
table
éé !
.
éé! "
Column
éé" (
<
éé( )
string
éé) /
>
éé/ 0
(
éé0 1
type
éé1 5
:
éé5 6
$str
éé7 F
,
ééF G
nullable
ééH P
:
ééP Q
true
ééR V
)
ééV W
}
èè 
,
èè 
constraints
êê 
:
êê 
table
êê "
=>
êê# %
{
ëë 
table
íí 
.
íí 

PrimaryKey
íí $
(
íí$ %
$str
íí% :
,
íí: ;
x
íí< =
=>
íí> @
new
ííA D
{
ííE F
x
ííG H
.
ííH I
UserId
ííI O
,
ííO P
x
ííQ R
.
ííR S
LoginProvider
ííS `
,
íí` a
x
ííb c
.
ííc d
Name
ííd h
}
ííi j
)
ííj k
;
íík l
table
ìì 
.
ìì 

ForeignKey
ìì $
(
ìì$ %
name
îî 
:
îî 
$str
îî F
,
îîF G
column
ïï 
:
ïï 
x
ïï  !
=>
ïï" $
x
ïï% &
.
ïï& '
UserId
ïï' -
,
ïï- .
principalTable
ññ &
:
ññ& '
$str
ññ( 5
,
ññ5 6
principalColumn
óó '
:
óó' (
$str
óó) -
,
óó- .
onDelete
òò  
:
òò  !
ReferentialAction
òò" 3
.
òò3 4
Cascade
òò4 ;
)
òò; <
;
òò< =
}
ôô 
)
ôô 
;
ôô 
migrationBuilder
õõ 
.
õõ 
CreateIndex
õõ (
(
õõ( )
name
úú 
:
úú 
$str
úú 2
,
úú2 3
table
ùù 
:
ùù 
$str
ùù )
,
ùù) *
column
ûû 
:
ûû 
$str
ûû  
)
ûû  !
;
ûû! "
migrationBuilder
†† 
.
†† 
CreateIndex
†† (
(
††( )
name
°° 
:
°° 
$str
°° %
,
°°% &
table
¢¢ 
:
¢¢ 
$str
¢¢ $
,
¢¢$ %
column
££ 
:
££ 
$str
££ (
,
££( )
unique
§§ 
:
§§ 
true
§§ 
,
§§ 
filter
•• 
:
•• 
$str
•• 6
)
••6 7
;
••7 8
migrationBuilder
ßß 
.
ßß 
CreateIndex
ßß (
(
ßß( )
name
®® 
:
®® 
$str
®® 2
,
®®2 3
table
©© 
:
©© 
$str
©© )
,
©©) *
column
™™ 
:
™™ 
$str
™™  
)
™™  !
;
™™! "
migrationBuilder
¨¨ 
.
¨¨ 
CreateIndex
¨¨ (
(
¨¨( )
name
≠≠ 
:
≠≠ 
$str
≠≠ 2
,
≠≠2 3
table
ÆÆ 
:
ÆÆ 
$str
ÆÆ )
,
ÆÆ) *
column
ØØ 
:
ØØ 
$str
ØØ  
)
ØØ  !
;
ØØ! "
migrationBuilder
±± 
.
±± 
CreateIndex
±± (
(
±±( )
name
≤≤ 
:
≤≤ 
$str
≤≤ 1
,
≤≤1 2
table
≥≥ 
:
≥≥ 
$str
≥≥ (
,
≥≥( )
column
¥¥ 
:
¥¥ 
$str
¥¥  
)
¥¥  !
;
¥¥! "
migrationBuilder
∂∂ 
.
∂∂ 
CreateIndex
∂∂ (
(
∂∂( )
name
∑∑ 
:
∑∑ 
$str
∑∑ "
,
∑∑" #
table
∏∏ 
:
∏∏ 
$str
∏∏ $
,
∏∏$ %
column
ππ 
:
ππ 
$str
ππ )
)
ππ) *
;
ππ* +
migrationBuilder
ªª 
.
ªª 
CreateIndex
ªª (
(
ªª( )
name
ºº 
:
ºº 
$str
ºº %
,
ºº% &
table
ΩΩ 
:
ΩΩ 
$str
ΩΩ $
,
ΩΩ$ %
column
ææ 
:
ææ 
$str
ææ ,
,
ææ, -
unique
øø 
:
øø 
true
øø 
,
øø 
filter
¿¿ 
:
¿¿ 
$str
¿¿ :
)
¿¿: ;
;
¿¿; <
}
¡¡ 	
	protected
√√ 
override
√√ 
void
√√ 
Down
√√  $
(
√√$ %
MigrationBuilder
√√% 5
migrationBuilder
√√6 F
)
√√F G
{
ƒƒ 	
migrationBuilder
≈≈ 
.
≈≈ 
	DropTable
≈≈ &
(
≈≈& '
name
∆∆ 
:
∆∆ 
$str
∆∆ (
)
∆∆( )
;
∆∆) *
migrationBuilder
»» 
.
»» 
	DropTable
»» &
(
»»& '
name
…… 
:
…… 
$str
…… (
)
……( )
;
……) *
migrationBuilder
ÀÀ 
.
ÀÀ 
	DropTable
ÀÀ &
(
ÀÀ& '
name
ÃÃ 
:
ÃÃ 
$str
ÃÃ (
)
ÃÃ( )
;
ÃÃ) *
migrationBuilder
ŒŒ 
.
ŒŒ 
	DropTable
ŒŒ &
(
ŒŒ& '
name
œœ 
:
œœ 
$str
œœ '
)
œœ' (
;
œœ( )
migrationBuilder
—— 
.
—— 
	DropTable
—— &
(
——& '
name
““ 
:
““ 
$str
““ (
)
““( )
;
““) *
migrationBuilder
‘‘ 
.
‘‘ 
	DropTable
‘‘ &
(
‘‘& '
name
’’ 
:
’’ 
$str
’’ #
)
’’# $
;
’’$ %
migrationBuilder
◊◊ 
.
◊◊ 
	DropTable
◊◊ &
(
◊◊& '
name
ÿÿ 
:
ÿÿ 
$str
ÿÿ #
)
ÿÿ# $
;
ÿÿ$ %
}
ŸŸ 	
}
⁄⁄ 
}€€ Ö
kE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Migrations\20211230200135_AddedImages.cs
	namespace 	
FarmaciaAPI
 
. 

Migrations  
{ 
public 

partial 
class 
AddedImages $
:% &
	Migration' 0
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
}

 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
} 	
} 
} û
sE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Migrations\20220102122104_AddedImagesProducts.cs
	namespace 	
FarmaciaAPI
 
. 

Migrations  
{ 
public 

partial 
class 
AddedImagesProducts ,
:- .
	Migration/ 8
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder		 
.		 
	AddColumn		 &
<		& '
string		' -
>		- .
(		. /
name

 
:

 
$str

 !
,

! "
table 
: 
$str !
,! "
type 
: 
$str %
,% &
nullable 
: 
true 
) 
;  
} 	
	protected 
override 
void 
Down  $
($ %
MigrationBuilder% 5
migrationBuilder6 F
)F G
{ 	
migrationBuilder 
. 

DropColumn '
(' (
name 
: 
$str !
,! "
table 
: 
$str !
)! "
;" #
} 	
} 
} ˚
`E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\LaboratoryFormModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
{ 
public 

class 
LaboratoryFormModel $
:% &
LaboratoryModel' 6
{		 
public

 
	IFormFile

 
Image

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
} 
}  
\E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\LaboratoryModel.cs
	namespace		 	
FarmaciaAPI		
 
.		 
Models		 
{

 
public 

class 
LaboratoryModel  
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
Address 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Phone	 
] 
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 

MakeOrders 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
	ImagePath 
{  !
get" %
;% &
set' *
;* +
}, -
public 
IEnumerable 
< 
ProductModel '
>' (
Products) 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
} 
} Ú
]E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\ProductFormModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
{ 
public		 

class		 
ProductFormModel		 !
:		! "
ProductModel		# /
{

 
public 
	IFormFile 
Image 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ü
YE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\ProductModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
{ 
public 

class 
ProductModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[ 	
Required	 
] 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
decimal

 
?

 
PurchasePrice

 %
{

& '
get

( +
;

+ ,
set

- 0
;

0 1
}

2 3
public 
decimal 
? 
	SalePrice !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
? 
Stock 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Presentation "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
TherapeuticAction '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
	ImagePath 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
LaboratoryId 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Ã	
ZE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\ResponseModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
{ 
public 

class 
ResponseModel 
< 
T  
>  !
{		 
public

 
T

 
Value

 
{

 
get

 
;

 
set

 !
;

! "
}

# $
public 
bool 
	isSuccess 
{ 
get  #
;# $
set% (
;( )
}* +
public 
IEnumerable 
< 
string !
>! "
Errors# )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
ErrorResponseType  
	ErrorType! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
public 

enum 
ErrorResponseType !
{ 
NotFound 
, 
InternalError 
, 
InvalidOperation 
} 
} É
iE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\Security\CreateRoleViewModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
. 
Security %
{ 
public		 

class		 
CreateRoleViewModel		 $
{

 
[ 	
Required	 
] 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
public 
string 
NormalizedName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} ù
mE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\Security\CreateUserRoleViewModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
. 
Security %
{ 
public 

class #
CreateUserRoleViewModel (
{		 
public

 
string

 
UserId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
RoleId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} «
dE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\Security\LoginViewModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
. 
Security %
{ 
public		 

class		 
LoginViewModel		 
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength '
=( )
$num* +
)+ ,
], -
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ◊
gE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\Security\RegisterViewModel.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
. 
Security %
{ 
public		 

class		 
RegisterViewModel		 "
{

 
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength '
=( )
$num* +
)+ ,
], -
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
, 
MinimumLength '
=( )
$num* +
)+ ,
], -
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
} 
} ï
iE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Models\Security\UserManagerResponse.cs
	namespace 	
FarmaciaAPI
 
. 
Models 
. 
Security %
{ 
public 

class 
UserManagerResponse $
{		 
public

 
string

 
Token

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
bool 
	IsSuccess 
{ 
get  #
;# $
set% (
;( )
}* +
public 
IEnumerable 
< 
string !
>! "
Errors# )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
DateTime 
? 

ExpireDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ¶

ME:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Program.cs
	namespace

 	
FarmaciaAPI


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ¶
ZE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\FileService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{		 
public

 

class

 
FileService

 
:

 
IFileService

 *
{ 
public 
string 

UploadFile  
(  !
	IFormFile! *
file+ /
)/ 0
{ 	
string 
	imagePath 
= 
string %
.% &
Empty& +
;+ ,
var 

folderName 
= 
Path !
.! "
Combine" )
() *
$str* 5
,5 6
$str7 ?
)? @
;@ A
var 

pathToSave 
= 
Path !
.! "
Combine" )
() *
	Directory* 3
.3 4
GetCurrentDirectory4 G
(G H
)H I
,I J

folderNameK U
)U V
;V W
if 
( 
file 
. 
Length 
> 
$num 
)  
{ 
string 
	extension  
=! "
Path# '
.' (
GetExtension( 4
(4 5
file5 9
.9 :
FileName: B
)B C
;C D
var 
fileName 
= 
$" !
{! "
Guid" &
.& '
NewGuid' .
(. /
)/ 0
.0 1
ToString1 9
(9 :
): ;
}; <
{< =
	extension= F
}F G
"G H
;H I
var 
fullPath 
= 
Path #
.# $
Combine$ +
(+ ,

pathToSave, 6
,6 7
fileName8 @
)@ A
;A B
	imagePath 
= 
Path  
.  !
Combine! (
(( )

folderName) 3
,3 4
fileName5 =
)= >
;> ?
using 
( 
var 
stream !
=" #
new$ '

FileStream( 2
(2 3
fullPath3 ;
,; <
FileMode= E
.E F
CreateF L
)L M
)M N
{ 
file 
. 
CopyTo 
(  
stream  &
)& '
;' (
} 
} 
return 
	imagePath 
; 
} 	
}   
}!! Ø
[E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\IFileService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{ 
public 

	interface 
IFileService !
{		 
string

 

UploadFile

 
(

 
	IFormFile

 #
file

$ (
)

( )
;

) *
} 
} Â

aE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\ILaboratoryService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{ 
public		 

	interface		 
ILaboratoryService		 '
{

 
Task 
< 
IEnumerable 
< 
LaboratoryModel (
>( )
>) * 
GetLaboratoriesAsync+ ?
(? @
string@ F
orderByG N
)N O
;O P
Task 
< 
LaboratoryModel 
> 
GetLaboratoryAsync 0
(0 1
int1 4
laboratoryId5 A
)A B
;B C
Task 
< 
LaboratoryModel 
> !
CreateLaboratoryAsync 3
(3 4
LaboratoryModel4 C

laboratoryD N
)N O
;O P
Task 
< 
LaboratoryModel 
> !
UpdateLaboratoryAsync 3
(3 4
int4 7
laboratoryId8 D
,D E
LaboratoryModelF U

laboratoryV `
)` a
;a b
Task !
DeleteLaboratoryAsync "
(" #
int# &
laboratoryId' 3
)3 4
;4 5
} 
} ò
^E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\IProductService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{ 
public		 

	interface		 
IProductService		 $
{

 
Task 
< 
IEnumerable 
< 
ProductModel %
>% &
>& '
GetProductsAsync( 8
(8 9
int9 <
laboratoryId= I
)I J
;J K
Task 
< 
ProductModel 
> 
GetProductAsync *
(* +
int+ .
laboratoryId/ ;
,; <
int= @
	productIdA J
)J K
;K L
Task 
< 
ProductModel 
> 
CreateProductAsync -
(- .
int. 1
laboratoryId2 >
,> ?
ProductModel@ L
productM T
)T U
;U V
Task 
DeleteProductAsync 
(  
int  #
laboratoryId$ 0
,0 1
int2 5
	productId6 ?
)? @
;@ A
Task 
< 
ProductModel 
> 
UpdateProductAsync -
(- .
int. 1
laboratoryId2 >
,> ?
int@ C
	productIdD M
,M N
ProductModelO [
product\ c
)c d
;d e
} 
} ï<
`E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\LaboratoryService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{ 
public 

class 
LaboratoryService "
:# $
ILaboratoryService% 7
{ 
private !
ILaboratoryRepository %!
_laboratoryRepository& ;
;; <
private 
IMapper 
_mapper 
;  
public 
LaboratoryService  
(  !!
ILaboratoryRepository! 6 
laboratoryRepository7 K
,K L
IMapperM T
mapperU [
)[ \
{ 	!
_laboratoryRepository !
=" # 
laboratoryRepository$ 8
;8 9
_mapper 
= 
mapper 
; 
} 	
private 
HashSet 
< 
string 
> 
_allowedSortValues  2
=3 4
new5 8
HashSet9 @
<@ A
stringA G
>G H
{I J
$strK O
,O P
$strQ W
,W X
$strY b
,b c
$strc j
,j k
$strk r
,r s
$strs 
}
Ä Å
;
Å Ç
public 
async 
Task 
< 
LaboratoryModel *
>* +!
CreateLaboratoryAsync, A
(A B
LaboratoryModelB Q

laboratoryR \
)\ ]
{ 	
var 
laboratoryEntity  
=! "
_mapper# *
.* +
Map+ .
<. /
LaboratoryEntity/ ?
>? @
(@ A

laboratoryA K
)K L
;L M!
_laboratoryRepository !
.! "
CreateLaboratory" 2
(2 3
laboratoryEntity3 C
)C D
;D E
var 
result 
= 
await !
_laboratoryRepository 4
.4 5
SaveChangesAsync5 E
(E F
)F G
;G H
if 
( 
result 
) 
{ 
return   
_mapper   
.   
Map   "
<  " #
LaboratoryModel  # 2
>  2 3
(  3 4
laboratoryEntity  4 D
)  D E
;  E F
}!! 
throw## 
new## 
	Exception## 
(##  
$str##  1
)##1 2
;##2 3
}$$ 	
public&& 
async&& 
Task&& !
DeleteLaboratoryAsync&& /
(&&/ 0
int&&0 3
laboratoryId&&4 @
)&&@ A
{'' 	
await(( 
GetLaboratoryAsync(( $
((($ %
laboratoryId((% 1
)((1 2
;((2 3
await)) !
_laboratoryRepository)) '
.))' (!
DeleteLaboratoryAsync))( =
())= >
laboratoryId))> J
)))J K
;))K L
var** 
result** 
=** 
await** !
_laboratoryRepository** 4
.**4 5
SaveChangesAsync**5 E
(**E F
)**F G
;**G H
if++ 
(++ 
!++ 
result++ 
)++ 
{,, 
throw-- 
new-- 
	Exception-- #
(--# $
$str--$ 5
)--5 6
;--6 7
}.. 
}// 	
public00 
async00 
Task00 
<00 
LaboratoryModel00 )
>00) *
GetLaboratoryAsync00+ =
(00= >
int00> A
laboratoryId00B N
)00N O
{11 	
var22 

laboratory22 
=22 
await22 "!
_laboratoryRepository22# 8
.228 9
GetLaboratoryAsync229 K
(22K L
laboratoryId22L X
)22X Y
;22Y Z
if44 
(44 

laboratory44 
==44 
null44 "
)44" #
throw55 
new55 $
NotFoundElementException55 2
(552 3
$"553 5
$str555 L
{55L M
laboratoryId55M Y
}55Y Z
$str55Z k
"55k l
)55l m
;55m n
return77 
_mapper77 
.77 
Map77 
<77 
LaboratoryModel77 .
>77. /
(77/ 0

laboratory770 :
)77: ;
;77; <
}88 	
public:: 
async:: 
Task:: 
<:: 
IEnumerable:: %
<::% &
LaboratoryModel::& 5
>::5 6
>::6 7 
GetLaboratoriesAsync::8 L
(::L M
string::M S
orderBy::T [
=::\ ]
$str::^ b
)::b c
{;; 	
if<< 
(<< 
!<< 
_allowedSortValues<< #
.<<# $
Contains<<$ ,
(<<, -
orderBy<<- 4
.<<4 5
ToLower<<5 <
(<<< =
)<<= >
)<<> ?
)<<? @
throw== 
new== ,
 InvalidElementOperationException== :
(==: ;
$"==; =
$str=== U
{==U V
orderBy==V ]
}==] ^
$str	==^ Ç
{
==Ç É
string
==É â
.
==â ä
Join
==ä é
(
==é è
$char
==è í
,
==í ì 
_allowedSortValues
==î ¶
)
==¶ ß
}
==ß ®
"
==® ©
)
==© ™
;
==™ ´
var??  
laboratoryEntityList?? $
=??% &
await??' ,!
_laboratoryRepository??- B
.??B C 
GetLaboratoriesAsync??C W
(??W X
orderBy??X _
)??_ `
;??` a
return@@ 
_mapper@@ 
.@@ 
Map@@ 
<@@ 
IEnumerable@@ *
<@@* +
LaboratoryModel@@+ :
>@@: ;
>@@; <
(@@< = 
laboratoryEntityList@@= Q
)@@Q R
;@@R S
}AA 	
publicDD 
asyncDD 
TaskDD 
<DD 
LaboratoryModelDD )
>DD) *!
UpdateLaboratoryAsyncDD+ @
(DD@ A
intDDA D
laboratoryIdDDE Q
,DDQ R
LaboratoryModelDDS b

laboratoryDDc m
)DDm n
{EE 	
awaitFF 
GetLaboratoryAsyncFF $
(FF$ %
laboratoryIdFF% 1
)FF1 2
;FF2 3
varGG 
laboratoryEntityGG  
=GG! "
_mapperGG# *
.GG* +
MapGG+ .
<GG. /
LaboratoryEntityGG/ ?
>GG? @
(GG@ A

laboratoryGGA K
)GGK L
;GGL M
awaitHH !
_laboratoryRepositoryHH '
.HH' (!
UpdateLaboratoryAsyncHH( =
(HH= >
laboratoryIdHH> J
,HHJ K
laboratoryEntityHHL \
)HH\ ]
;HH] ^
varII 
resultII 
=II 
awaitII !
_laboratoryRepositoryII 4
.II4 5
SaveChangesAsyncII5 E
(IIE F
)IIF G
;IIG H
ifJJ 
(JJ 
resultJJ 
)JJ 
{KK 
returnLL 
_mapperLL 
.LL 
MapLL "
<LL" #
LaboratoryModelLL# 2
>LL2 3
(LL3 4
laboratoryEntityLL4 D
)LLD E
;LLE F
}MM 
throwOO 
newOO 
	ExceptionOO 
(OO  
$strOO  1
)OO1 2
;OO2 3
}PP 	
}QQ 
}RR  ?
]E:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\ProductService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
{ 
public 

class 
ProductService 
:  !
IProductService" 1
{ 
private !
ILaboratoryRepository %!
_laboratoryRepository& ;
;; <
private 
IMapper 
_mapper 
;  
public 
ProductService 
( !
ILaboratoryRepository 3 
laboratoryRepository4 H
,H I
IMapperJ Q
mapperR X
)X Y
{ 	!
_laboratoryRepository !
=" # 
laboratoryRepository$ 8
;8 9
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ProductModel &
>& '
CreateProductAsync( :
(: ;
int; >
laboratoryId? K
,K L
ProductModelM Y
productZ a
)a b
{ 	
await #
ValidateLaboratoryAsync )
() *
laboratoryId* 6
)6 7
;7 8
product 
. 
LaboratoryId  
=! "
laboratoryId# /
;/ 0
var 
entity 
= 
_mapper  
.  !
Map! $
<$ %
ProductEntity% 2
>2 3
(3 4
product4 ;
); <
;< =!
_laboratoryRepository !
.! "
CreateProduct" /
(/ 0
laboratoryId0 <
,< =
entity> D
)D E
;E F
var 
result 
= 
await !
_laboratoryRepository 4
.4 5
SaveChangesAsync5 E
(E F
)F G
;G H
if 
( 
result 
) 
{ 
return 
_mapper 
. 
Map "
<" #
ProductModel# /
>/ 0
(0 1
entity1 7
)7 8
;8 9
}   
throw"" 
new"" 
	Exception"" 
(""  
$str""  1
)""1 2
;""2 3
}## 	
public%% 
async%% 
Task%% 
DeleteProductAsync%% -
(%%- .
int%%. 1
laboratoryId%%2 >
,%%> ?
int%%@ C
	productId%%D M
)%%M N
{&& 	
await'' 
GetProductAsync'' !
(''! "
laboratoryId''" .
,''. /
	productId''0 9
)''9 :
;'': ;
await(( !
_laboratoryRepository(( '
.((' (
DeleteProductAsync((( :
(((: ;
laboratoryId((; G
,((G H
	productId((I R
)((R S
;((S T
var)) 
result)) 
=)) 
await)) !
_laboratoryRepository)) 4
.))4 5
SaveChangesAsync))5 E
())E F
)))F G
;))G H
if** 
(** 
!** 
result** 
)** 
{++ 
throw,, 
new,, 
	Exception,, #
(,,# $
$str,,$ 5
),,5 6
;,,6 7
}.. 
}// 	
public11 
async11 
Task11 
<11 
ProductModel11 '
>11' (
GetProductAsync11) 8
(118 9
int119 <
laboratoryId11= I
,11I J
int11K N
	productId11O X
)11X Y
{22 	
await33 #
ValidateLaboratoryAsync33 )
(33) *
laboratoryId33* 6
)336 7
;337 8
var55 
product55 
=55 
await55 !
_laboratoryRepository55  5
.555 6
GetProductAsync556 E
(55E F
laboratoryId55F R
,55R S
	productId55T ]
)55] ^
;55^ _
if66 
(66 
product66 
==66 
null66 
)66  
throw77 
new77 $
NotFoundElementException77 2
(772 3
$"773 5
$str775 I
{77I J
	productId77J S
}77S T
$str	77T á
{
77á à
laboratoryId
77à î
}
77î ï
$str
77ï ñ
"
77ñ ó
)
77ó ò
;
77ò ô
return99 
_mapper99 
.99 
Map99 
<99 
ProductModel99 +
>99+ ,
(99, -
product99- 4
)994 5
;995 6
}:: 	
public<< 
async<< 
Task<< 
<<< 
IEnumerable<< %
<<<% &
ProductModel<<& 2
><<2 3
><<3 4
GetProductsAsync<<5 E
(<<E F
int<<F I
laboratoryId<<J V
)<<V W
{== 	
await>> #
ValidateLaboratoryAsync>> )
(>>) *
laboratoryId>>* 6
)>>6 7
;>>7 8
var?? 
products?? 
=?? 
await??  !
_laboratoryRepository??! 6
.??6 7
GetProductsAsync??7 G
(??G H
laboratoryId??H T
)??T U
;??U V
return@@ 
_mapper@@ 
.@@ 
Map@@ 
<@@ 
IEnumerable@@ *
<@@* +
ProductModel@@+ 7
>@@7 8
>@@8 9
(@@9 :
products@@: B
)@@B C
;@@C D
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ProductModelCC &
>CC& '
UpdateProductAsyncCC( :
(CC: ;
intCC; >
laboratoryIdCC? K
,CCK L
intCCM P
	productIdCCQ Z
,CCZ [
ProductModelCC\ h
productCCi p
)CCp q
{DD 	
awaitEE 
GetProductAsyncEE !
(EE! "
laboratoryIdEE" .
,EE. /
	productIdEE0 9
)EE9 :
;EE: ;
varFF 
entityFF 
=FF 
_mapperFF  
.FF  !
MapFF! $
<FF$ %
ProductEntityFF% 2
>FF2 3
(FF3 4
productFF4 ;
)FF; <
;FF< =
awaitGG !
_laboratoryRepositoryGG '
.GG' (
UpdateProductAsyncGG( :
(GG: ;
laboratoryIdGG; G
,GGG H
	productIdGGI R
,GGR S
entityGGT Z
)GGZ [
;GG[ \
varHH 
resultHH 
=HH 
awaitHH !
_laboratoryRepositoryHH 4
.HH4 5
SaveChangesAsyncHH5 E
(HHE F
)HHF G
;HHG H
ifII 
(II 
resultII 
)II 
{JJ 
returnKK 
_mapperKK 
.KK 
MapKK "
<KK" #
ProductModelKK# /
>KK/ 0
(KK0 1
entityKK1 7
)KK7 8
;KK8 9
}LL 
throwNN 
newNN 
	ExceptionNN 
(NN  
$strNN  1
)NN1 2
;NN2 3
}OO 	
privatePP 
asyncPP 
TaskPP #
ValidateLaboratoryAsyncPP 2
(PP2 3
intPP3 6
laboratoryIdPP7 C
)PPC D
{QQ 	
varRR 

laboratoryRR 
=RR 
awaitRR "!
_laboratoryRepositoryRR# 8
.RR8 9
GetLaboratoryAsyncRR9 K
(RRK L
laboratoryIdRRL X
)RRX Y
;RRY Z
ifSS 
(SS 

laboratorySS 
==SS 
nullSS "
)SS" #
throwTT 
newTT $
NotFoundElementExceptionTT 2
(TT2 3
$"TT3 5
$strTT5 L
{TTL M
laboratoryIdTTM Y
}TTY Z
$strTTZ k
"TTk l
)TTl m
;TTm n
}UU 	
}VV 
}WW ô	
dE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\Security\IUserService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
. 
Security '
{ 
public		 

	interface		 
IUserService		 !
{

 
Task 
< 
UserManagerResponse  
>  !
RegisterUserAsync" 3
(3 4
RegisterViewModel4 E
modelF K
)K L
;L M
Task 
< 
UserManagerResponse  
>  !
CreateRoleAsync" 1
(1 2
CreateRoleViewModel2 E
modelF K
)K L
;L M
Task 
< 
UserManagerResponse  
>  !
LoginUserAsync" 0
(0 1
LoginViewModel1 ?
model@ E
)E F
;F G
Task 
< 
UserManagerResponse  
>  !
CreateUserRoleAsync" 5
(5 6#
CreateUserRoleViewModel6 M
modelN S
)S T
;T U
} 
} Ëi
cE:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Services\Security\UserService.cs
	namespace 	
FarmaciaAPI
 
. 
Services 
. 
Security '
{ 
public 

class 
UserService 
: 
IUserService +
{ 
private 
UserManager 
< 
IdentityUser (
>( )
userManager* 5
;5 6
private 
RoleManager 
< 
IdentityRole (
>( )
roleManager* 5
;5 6
private 
IConfiguration 
configuration ,
;, -
public 
UserService 
( 
UserManager &
<& '
IdentityUser' 3
>3 4
userManager5 @
,@ A
RoleManagerB M
<M N
IdentityRoleN Z
>Z [
roleManager\ g
,g h
IConfigurationi w
configuration	x Ö
)
Ö Ü
{ 	
this 
. 
userManager 
= 
userManager *
;* +
this 
. 
roleManager 
= 
roleManager *
;* +
this 
. 
configuration 
=  
configuration! .
;. /
} 	
public 
async 
Task 
< 
UserManagerResponse -
>- .
LoginUserAsync/ =
(= >
LoginViewModel> L
modelM R
)R S
{ 	
var 
user 
= 
await 
userManager (
.( )
FindByEmailAsync) 9
(9 :
model: ?
.? @
Email@ E
)E F
;F G
if!! 
(!! 
user!! 
==!! 
null!! 
)!! 
{"" 
return## 
new## 
UserManagerResponse## .
{$$ 
Token%% 
=%% 
$str%% F
,%%F G
	IsSuccess&& 
=&& 
false&&  %
,&&% &
}'' 
;'' 
}(( 
var** 
result** 
=** 
await** 
userManager** *
.*** +
CheckPasswordAsync**+ =
(**= >
user**> B
,**B C
model**D I
.**I J
Password**J R
)**R S
;**S T
if,, 
(,, 
!,, 
result,, 
),, 
return-- 
new-- 
UserManagerResponse-- .
{.. 
Token// 
=// 
$str// .
,//. /
	IsSuccess00 
=00 
false00  %
,00% &
}11 
;11 
var33 
roles33 
=33 
await33 
userManager33 )
.33) *
GetRolesAsync33* 7
(337 8
user338 <
)33< =
;33= >
var55 
claims55 
=55 
new55 
List55 !
<55! "
Claim55" '
>55' (
(55( )
)55) *
{66 
new77 
Claim77 
(77 
$str77 !
,77! "
model77# (
.77( )
Email77) .
)77. /
,77/ 0
new88 
Claim88 
(88 

ClaimTypes88 $
.88$ %
NameIdentifier88% 3
,883 4
user885 9
.889 :
Id88: <
)88< =
,88= >
}99 
;99 
foreach;; 
(;; 
var;; 
role;; 
in;;  
roles;;! &
);;& '
{<< 
claims== 
.== 
Add== 
(== 
new== 
Claim== $
(==$ %

ClaimTypes==% /
.==/ 0
Role==0 4
,==4 5
role==6 :
)==: ;
)==; <
;==< =
}>> 
varAA 
keyAA 
=AA 
newAA  
SymmetricSecurityKeyAA .
(AA. /
EncodingAA/ 7
.AA7 8
UTF8AA8 <
.AA< =
GetBytesAA= E
(AAE F
configurationAAF S
[AAS T
$strAAT f
]AAf g
)AAg h
)AAh i
;AAi j
varCC 
tokenCC 
=CC 
newCC 
JwtSecurityTokenCC ,
(CC, -
issuerDD 
:DD 
configurationDD %
[DD% &
$strDD& ;
]DD; <
,DD< =
audienceEE 
:EE 
configurationEE '
[EE' (
$strEE( ?
]EE? @
,EE@ A
claimsFF 
:FF 
claimsFF 
,FF 
expiresGG 
:GG 
DateTimeGG !
.GG! "
NowGG" %
.GG% &
AddHoursGG& .
(GG. /
$numGG/ 0
)GG0 1
,GG1 2
signingCredentialsHH "
:HH" #
newHH$ '
SigningCredentialsHH( :
(HH: ;
keyHH; >
,HH> ?
SecurityAlgorithmsHH@ R
.HHR S

HmacSha256HHS ]
)HH] ^
)HH^ _
;HH_ `
stringJJ 
tokenAsStringJJ  
=JJ! "
newJJ# &#
JwtSecurityTokenHandlerJJ' >
(JJ> ?
)JJ? @
.JJ@ A

WriteTokenJJA K
(JJK L
tokenJJL Q
)JJQ R
;JJR S
returnLL 
newLL 
UserManagerResponseLL *
{MM 
TokenNN 
=NN 
tokenAsStringNN %
,NN% &
	IsSuccessOO 
=OO 
trueOO  
,OO  !

ExpireDatePP 
=PP 
tokenPP "
.PP" #
ValidToPP# *
}QQ 
;QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
UserManagerResponseTT -
>TT- .
RegisterUserAsyncTT/ @
(TT@ A
RegisterViewModelTTA R
modelTTS X
)TTX Y
{UU 	
ifVV 
(VV 
modelVV 
==VV 
nullVV 
)VV 
{WW 
throwXX 
newXX "
NullReferenceExceptionXX 0
(XX0 1
$strXX1 @
)XX@ A
;XXA B
}YY 
if[[ 
([[ 
model[[ 
.[[ 
Password[[ 
!=[[ !
model[[" '
.[[' (
ConfirmPassword[[( 7
)[[7 8
return\\ 
new\\ 
UserManagerResponse\\ .
{]] 
Token^^ 
=^^ 
$str^^ I
,^^I J
	IsSuccess__ 
=__ 
false__  %
,__% &
}`` 
;`` 
varbb 
identityUserbb 
=bb 
newbb "
IdentityUserbb# /
{cc 
Emaildd 
=dd 
modeldd 
.dd 
Emaildd #
,dd# $
UserNameee 
=ee 
modelee  
.ee  !
Emailee! &
}ff 
;ff 
varhh 
resulthh 
=hh 
awaithh 
userManagerhh *
.hh* +
CreateAsynchh+ 6
(hh6 7
identityUserhh7 C
,hhC D
modelhhE J
.hhJ K
PasswordhhK S
)hhS T
;hhT U
ifjj 
(jj 
resultjj 
.jj 
	Succeededjj  
)jj  !
{kk 
returnll 
newll 
UserManagerResponsell .
{mm 
Tokennn 
=nn 
$strnn 8
,nn8 9
	IsSuccessoo 
=oo 
trueoo  $
,oo$ %
}pp 
;pp 
}qq 
returnss 
newss 
UserManagerResponsess *
{tt 
Tokenuu 
=uu 
$struu -
,uu- .
	IsSuccessvv 
=vv 
falsevv !
,vv! "
Errorsww 
=ww 
resultww 
.ww  
Errorsww  &
.ww& '
Selectww' -
(ww- .
eww. /
=>ww0 2
eww3 4
.ww4 5
Descriptionww5 @
)ww@ A
}xx 
;xx 
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
UserManagerResponse{{ -
>{{- .
CreateRoleAsync{{/ >
({{> ?
CreateRoleViewModel{{? R
model{{S X
){{X Y
{|| 	
var~~ 
identityRole~~ 
=~~ 
new~~ "
IdentityRole~~# /
(~~/ 0
)~~0 1
{ 
Name
ÄÄ 
=
ÄÄ 
model
ÄÄ 
.
ÄÄ 
Name
ÄÄ !
,
ÄÄ! "
NormalizedName
ÅÅ 
=
ÅÅ  
model
ÅÅ! &
.
ÅÅ& '
NormalizedName
ÅÅ' 5
}
ÇÇ 
;
ÇÇ 
var
ÑÑ 
result
ÑÑ 
=
ÑÑ 
await
ÑÑ 
roleManager
ÑÑ *
.
ÑÑ* +
CreateAsync
ÑÑ+ 6
(
ÑÑ6 7
identityRole
ÑÑ7 C
)
ÑÑC D
;
ÑÑD E
if
ÜÜ 
(
ÜÜ 
result
ÜÜ 
.
ÜÜ 
	Succeeded
ÜÜ  
)
ÜÜ  !
{
áá 
return
àà 
new
àà !
UserManagerResponse
àà .
{
ââ 
Token
ää 
=
ää 
$str
ää 8
,
ää8 9
	IsSuccess
ãã 
=
ãã 
true
ãã  $
,
ãã$ %
}
åå 
;
åå 
}
çç 
return
èè 
new
èè !
UserManagerResponse
èè *
{
êê 
Token
ëë 
=
ëë 
$str
ëë -
,
ëë- .
	IsSuccess
íí 
=
íí 
false
íí !
,
íí! "
Errors
ìì 
=
ìì 
result
ìì 
.
ìì  
Errors
ìì  &
.
ìì& '
Select
ìì' -
(
ìì- .
e
ìì. /
=>
ìì0 2
e
ìì3 4
.
ìì4 5
Description
ìì5 @
)
ìì@ A
}
îî 
;
îî 
}
ïï 	
public
òò 
async
òò 
Task
òò 
<
òò !
UserManagerResponse
òò -
>
òò- .!
CreateUserRoleAsync
òò/ B
(
òòB C%
CreateUserRoleViewModel
òòC Z
model
òò[ `
)
òò` a
{
ôô 	
var
öö 
role
öö 
=
öö 
await
öö 
roleManager
öö (
.
öö( )
FindByIdAsync
öö) 6
(
öö6 7
model
öö7 <
.
öö< =
RoleId
öö= C
)
ööC D
;
ööD E
if
õõ 
(
õõ 
role
õõ 
==
õõ 
null
õõ 
)
õõ 
{
úú 
return
ùù 
new
ùù !
UserManagerResponse
ùù .
{
ûû 
Token
üü 
=
üü 
$str
üü 1
,
üü1 2
	IsSuccess
†† 
=
†† 
false
††  %
}
°° 
;
°° 
}
¢¢ 
var
§§ 
user
§§ 
=
§§ 
await
§§ 
userManager
§§ (
.
§§( )
FindByIdAsync
§§) 6
(
§§6 7
model
§§7 <
.
§§< =
UserId
§§= C
)
§§C D
;
§§D E
if
•• 
(
•• 
role
•• 
==
•• 
null
•• 
)
•• 
{
¶¶ 
return
ßß 
new
ßß !
UserManagerResponse
ßß .
{
®® 
Token
©© 
=
©© 
$str
©© 1
,
©©1 2
	IsSuccess
™™ 
=
™™ 
false
™™  %
}
´´ 
;
´´ 
}
¨¨ 
if
ÆÆ 
(
ÆÆ 
await
ÆÆ 
userManager
ÆÆ !
.
ÆÆ! "
IsInRoleAsync
ÆÆ" /
(
ÆÆ/ 0
user
ÆÆ0 4
,
ÆÆ4 5
role
ÆÆ6 :
.
ÆÆ: ;
Name
ÆÆ; ?
)
ÆÆ? @
)
ÆÆ@ A
{
ØØ 
return
∞∞ 
new
∞∞ !
UserManagerResponse
∞∞ .
{
±± 
Token
≤≤ 
=
≤≤ 
$str
≤≤ 3
,
≤≤3 4
	IsSuccess
≥≥ 
=
≥≥ 
false
≥≥  %
}
¥¥ 
;
¥¥ 
}
µµ 
var
∑∑ 
result
∑∑ 
=
∑∑ 
await
∑∑ 
userManager
∑∑ *
.
∑∑* +
AddToRoleAsync
∑∑+ 9
(
∑∑9 :
user
∑∑: >
,
∑∑> ?
role
∑∑@ D
.
∑∑D E
Name
∑∑E I
)
∑∑I J
;
∑∑J K
if
ππ 
(
ππ 
result
ππ 
.
ππ 
	Succeeded
ππ  
)
ππ  !
{
∫∫ 
return
ªª 
new
ªª !
UserManagerResponse
ªª .
{
ºº 
Token
ΩΩ 
=
ΩΩ 
$str
ΩΩ +
,
ΩΩ+ ,
	IsSuccess
ææ 
=
ææ 
true
ææ  $
}
øø 
;
øø 
}
¿¿ 
return
¬¬ 
new
¬¬ !
UserManagerResponse
¬¬ *
{
√√ 
Token
ƒƒ 
=
ƒƒ 
$str
ƒƒ .
,
ƒƒ. /
	IsSuccess
≈≈ 
=
≈≈ 
false
≈≈ !
}
∆∆ 
;
∆∆ 
}
«« 	
}
»» 
}…… ÿA
ME:\CAROLINA\6_SEMESTRE\TecnologiasWeb\FarmaciaAPIFinal\FarmaciaAPI\Startup.cs
	namespace 	
FarmaciaAPI
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration   
=   
configuration   )
;  ) *
}!! 	
public## 
IConfiguration## 
Configuration## +
{##, -
get##. 1
;##1 2
}##3 4
public&& 
void&& 
ConfigureServices&& %
(&&% &
IServiceCollection&&& 8
services&&9 A
)&&A B
{'' 	
services(( 
.(( 
AddControllers(( #
(((# $
)(($ %
;((% &
services)) 
.)) 
AddTransient)) !
<))! "
ILaboratoryService))" 4
,))4 5
LaboratoryService))6 G
>))G H
())H I
)))I J
;))J K
services** 
.** 
AddTransient** !
<**! "
IProductService**" 1
,**1 2
ProductService**3 A
>**A B
(**B C
)**C D
;**D E
services++ 
.++ 
AddTransient++ !
<++! "!
ILaboratoryRepository++" 7
,++7 8 
LaboratoryRepository++9 M
>++M N
(++N O
)++O P
;++P Q
services,, 
.,, 
AddTransient,, !
<,,! "
IFileService,," .
,,,. /
FileService,,0 ;
>,,; <
(,,< =
),,= >
;,,> ?
services-- 
.-- 
	AddScoped-- 
<-- 
IUserService-- +
,--+ ,
UserService--- 8
>--8 9
(--9 :
)--: ;
;--; <
services00 
.00 
AddAutoMapper00 "
(00" #
typeof00# )
(00) *
Startup00* 1
)001 2
)002 3
;003 4
services33 
.33 
AddDbContext33 !
<33! "
FarmaciaDBContext33" 3
>333 4
(334 5
options335 <
=>33= ?
{33@ A
options44 
.44 
UseSqlServer44 $
(44$ %
Configuration44% 2
.442 3
GetConnectionString443 F
(44F G
$str44G T
)44T U
)44U V
;44V W
}55 
)55 
;55 
services77 
.77 
AddIdentity77  
<77  !
IdentityUser77! -
,77- .
IdentityRole77/ ;
>77; <
(77< =
options77= D
=>77E G
{77H I
options88 
.88 
Password88  
.88  !
RequireDigit88! -
=88. /
true880 4
;884 5
options99 
.99 
Password99  
.99  !
RequireLowercase99! 1
=992 3
true994 8
;998 9
}:: 
):: 
.:: $
AddEntityFrameworkStores:: '
<::' (
FarmaciaDBContext::( 9
>::9 :
(::: ;
)::; <
.;; $
AddDefaultTokenProviders;; %
(;;% &
);;& '
;;;' (
services>> 
.>> 
AddAuthentication>> &
(>>& '
auth>>' +
=>>>, .
{?? 
auth@@ 
.@@ %
DefaultAuthenticateScheme@@ .
=@@/ 0
JwtBearerDefaults@@1 B
.@@B C 
AuthenticationScheme@@C W
;@@W X
authAA 
.AA "
DefaultChallengeSchemeAA +
=AA, -
JwtBearerDefaultsAA. ?
.AA? @ 
AuthenticationSchemeAA@ T
;AAT U
}BB 
)BB 
.BB 
AddJwtBearerBB 
(BB 
optionsBB #
=>BB$ &
{CC 
optionsDD 
.DD %
TokenValidationParametersDD 1
=DD2 3
newDD4 7
	MicrosoftDD8 A
.DDA B
IdentityModelDDB O
.DDO P
TokensDDP V
.DDV W%
TokenValidationParametersDDW p
{EE 
ValidateIssuerFF "
=FF# $
trueFF% )
,FF) *
ValidateAudienceGG $
=GG% &
trueGG' +
,GG+ ,
ValidAudienceHH !
=HH" #
ConfigurationHH$ 1
[HH1 2
$strHH2 I
]HHI J
,HHJ K
ValidIssuerII 
=II  !
ConfigurationII" /
[II/ 0
$strII0 E
]IIE F
,IIF G!
RequireExpirationTimeJJ )
=JJ* +
trueJJ, 0
,JJ0 1
IssuerSigningKeyKK $
=KK% &
newKK' * 
SymmetricSecurityKeyKK+ ?
(KK? @
EncodingKK@ H
.KKH I
UTF8KKI M
.KKM N
GetBytesKKN V
(KKV W
ConfigurationKKW d
[KKd e
$strKKe w
]KKw x
)KKx y
)KKy z
,KKz {$
ValidateIssuerSigningKeyLL ,
=LL- .
trueLL/ 3
}MM 
;MM 
}NN 
)NN 
;NN 
servicesOO 
.OO 
AddCorsOO 
(OO 
cOO 
=>OO !
{PP 
cQQ 
.QQ 
	AddPolicyQQ 
(QQ 
$strQQ )
,QQ) *
optionsQQ+ 2
=>QQ3 5
{QQ6 7
optionsQQ8 ?
.QQ? @
AllowAnyOriginQQ@ N
(QQN O
)QQO P
;QQP Q
optionsQQR Y
.QQY Z
AllowAnyMethodQQZ h
(QQh i
)QQi j
;QQj k
optionsQQl s
.QQs t
AllowAnyHeader	QQt Ç
(
QQÇ É
)
QQÉ Ñ
;
QQÑ Ö
}
QQÜ á
)
QQá à
;
QQà â
}RR 
)RR 
;RR 
}SS 	
publicVV 
voidVV 
	ConfigureVV 
(VV 
IApplicationBuilderVV 1
appVV2 5
,VV5 6
IWebHostEnvironmentVV7 J
envVVK N
)VVN O
{WW 	
ifXX 
(XX 
envXX 
.XX 
IsDevelopmentXX !
(XX! "
)XX" #
)XX# $
{YY 
appZZ 
.ZZ %
UseDeveloperExceptionPageZZ -
(ZZ- .
)ZZ. /
;ZZ/ 0
app[[ 
.[[ 
UseCors[[ 
([[ 
options[[ #
=>[[$ &
{[[' (
options[[) 0
.[[0 1
AllowAnyOrigin[[1 ?
([[? @
)[[@ A
;[[A B
options[[C J
.[[J K
AllowAnyMethod[[K Y
([[Y Z
)[[Z [
;[[[ \
options[[] d
.[[d e
AllowAnyHeader[[e s
([[s t
)[[t u
;[[u v
}[[w x
)[[x y
;[[y z
}\\ 
app^^ 
.^^ 

UseRouting^^ 
(^^ 
)^^ 
;^^ 
app__ 
.__ 
UseAuthentication__ !
(__! "
)__" #
;__# $
app`` 
.`` 
UseAuthorization``  
(``  !
)``! "
;``" #
appbb 
.bb 
UseEndpointsbb 
(bb 
	endpointsbb &
=>bb' )
{cc 
	endpointsdd 
.dd 
MapControllersdd (
(dd( )
)dd) *
;dd* +
}ee 
)ee 
;ee 
appgg 
.gg 
UseStaticFilesgg 
(gg 
)gg  
;gg  !
apphh 
.hh 
UseStaticFileshh 
(hh 
newhh "
StaticFileOptionshh# 4
(hh4 5
)hh5 6
{ii 
FileProviderjj 
=jj 
newjj " 
PhysicalFileProviderjj# 7
(jj7 8
Pathjj8 <
.jj< =
Combinejj= D
(jjD E
	DirectoryjjE N
.jjN O
GetCurrentDirectoryjjO b
(jjb c
)jjc d
,jjd e
$strjjf r
)jjr s
)jjs t
,jjt u
RequestPathkk 
=kk 
newkk !

PathStringkk" ,
(kk, -
$strkk- 9
)kk9 :
}ll 
)ll 
;ll 
}mm 	
}nn 
}oo 