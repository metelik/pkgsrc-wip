# $NetBSD: buildlink3.mk,v 1.3 2008/03/06 14:54:08 thomasklausner Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
EFREET_BUILDLINK3_MK:=	${EFREET_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	efreet
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nefreet}
BUILDLINK_PACKAGES+=	efreet
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}efreet

.if ${EFREET_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.efreet+=	efreet>=0.0.3.006
BUILDLINK_ABI_DEPENDS.efreet?=	efreet>=0.0.3.042nb1
BUILDLINK_PKGSRCDIR.efreet?=	../../wip/efreet
.endif	# EFREET_BUILDLINK3_MK

.include        "../../wip/ecore/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
