# $NetBSD: buildlink3.mk,v 1.1.1.1 2008/11/17 08:09:43 phonohawk Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
MISSINGH_BUILDLINK3_MK:=	${MISSINGH_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	MissingH
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NMissingH}
BUILDLINK_PACKAGES+=	MissingH
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}MissingH

.if ${MISSINGH_BUILDLINK3_MK} == "+"
BUILDLINK_DEPMETHOD.MissingH?=	build
BUILDLINK_API_DEPENDS.MissingH+=	MissingH>=1.0.2.1
BUILDLINK_PKGSRCDIR.MissingH?=	../../wip/MissingH
.endif	# MISSINGH_BUILDLINK3_MK

.include "../../wip/hslogger/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
