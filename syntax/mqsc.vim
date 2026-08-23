" Syntax highlighting for IBM MQ Script Commands (MQSC)
" Maintainer: nvim-mqsc-syntax contributors

if exists("b:current_syntax")
  finish
endif

syntax case ignore

" An asterisk in the first non-blank column starts an MQSC comment.
syntax match mqscComment /^\s*\*.*$/ contains=@Spell

" A plus or minus at the end of a line continues an MQSC command.
syntax match mqscContinuation /[+-]\s*$/

syntax keyword mqscCommand
      \ ALTER ARCHIVE BACKUP CLEAR DEFINE DELETE DISPLAY
      \ END MIGRATE MOVE PING PURGE QUIESCE RECOVER
      \ REFRESH RESET RESOLVE RESUME SET START STOP SUSPEND

syntax keyword mqscObject
      \ AUTHINFO AUTHREC CFSTRUCT CHANNEL CHLAUTH COMMINFO
      \ LISTENER NAMELIST PROCESS QMGR QUEUE SERVICE STGCLASS
      \ SUB TOPIC

syntax keyword mqscType
      \ QALIAS QLOCAL QMODEL QREMOTE
      \ CLNTCONN CLUSRCVR CLUSSDR RCVR RQSTR SDR SERVER
      \ SVR SVRCONN

syntax keyword mqscAttribute
      \ ALTDATE ALTTIME APPLNAME AUTHOREV BOQNAME BOTHRESH
      \ CCSID CERTLABL CHLTYPE CLUSTER CLUSNL CONNAME
      \ DEFPRTY DEFPSIST DEFSOPT DESCR DISTL DEFREADA
      \ GET HARDENBO INITQ IPADDR MCAUSER MAXDEPTH MAXMSGL
      \ MAXINST MAXINSTC MAXPRTY MONCHL MONQ MSGDLVSQ
      \ NOTRIGGER PROCESS PUT QDEPTHHI QDEPTHLO QDPHIEV
      \ QDPLOEV QDPMAXEV QSGDISP RCVDATA RCVEXIT REPLACE
      \ RETINTVL SCYDATA SCYEXIT SENDDATA SENDEXIT SEQWRAP
      \ SHARE SSLCAUTH SSLCIPH SSLPEER TARGET TARGQ
      \ TRIGDATA TRIGGER TRIGDPTH TRIGMPRI TRIGTYPE TYPE
      \ USAGE

syntax keyword mqscBoolean YES NO ENABLED DISABLED REQUIRED OPTIONAL
syntax keyword mqscConstant ALL ANY ASPARENT DEFAULT NONE SYSTEM

" MQSC strings use single quotes; doubled single quotes escape a quote.
syntax region mqscString start=/'/ skip=/''/ end=/'/
syntax match mqscNumber /\<\d\+\>/
syntax match mqscDelimiter /[()]/

highlight default link mqscComment Comment
highlight default link mqscCommand Statement
highlight default link mqscObject Type
highlight default link mqscAttribute Identifier
highlight default link mqscType Keyword
highlight default link mqscBoolean Boolean
highlight default link mqscConstant Constant
highlight default link mqscString String
highlight default link mqscNumber Number
highlight default link mqscContinuation Operator
highlight default link mqscDelimiter Delimiter

let b:current_syntax = "mqsc"
