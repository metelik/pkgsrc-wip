# $NetBSD$

DISTNAME=	schily-2018-09-26
PKGNAME=	star-1.5.4
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=schilytools/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://s-tar.sf.net/
COMMENT=	Unique standard tape archiver
LICENSE=	cddl-1.0

MAKE_JOBS_SAFE=	no

USE_TOOLS+=	tbl
TOOL_DEPENDS+=	smake-[0-9]*:../../wip/smake
SMAKE=		MAKEFLAGS= smake
MAKE_FLAGS+=	DESTDIR=${DESTDIR:Q} INS_BASE=${PREFIX:Q} DEFMANBASE=. MANDIR=${PKGMANDIR:Q}
# Honor CPPFLAGS, CFLAGS and LDFLAGS
MAKE_FLAGS+=	CPPOPTX=${CPPFLAGS:Q} COPTX=${CFLAGS:Q} LDOPTX=${LDFLAGS:Q}

# The default location is /etc/default/star
# We patch the documentation appropriately. Additionally, we also provide a
# MESSAGE stating the reasons we do this, as required by the license.
STAR_CONF?=	${PKG_SYSCONFDIR}/star

.if ${STAR_CONF} != "/etc/default/star"
MESSAGE_SRC+=	MESSAGE.star
MESSAGE_SUBST+=	PKGNAME_NOREV=${PKGNAME_NOREV:Q}
MESSAGE_SUBST+=	STAR_CONF=${STAR_CONF:Q}
.endif

CONF_FILES=	${PREFIX}/share/examples/star/star ${STAR_CONF}
AUTO_MKDIRS=	yes

SUBST_CLASSES+=		fix
SUBST_STAGE.fix=	pre-configure
SUBST_FILES.fix+=	star/star.1
SUBST_FILES.fix+=	star/star.dfl
SUBST_FILES.fix+=	star/defaults.c
SUBST_SED.fix=		-e "s,/etc/default/star,${STAR_CONF},g"
SUBST_MESSAGE.fix=	Replace defaults file paths.

.include "../../mk/bsd.prefs.mk"

# Shared platform specific code for schilytools (provided by smake package)
.include "../../wip/smake/Makefile.common"

do-configure:
	cd ${WRKSRC}/inc && ${SMAKE} ${MAKE_FLAGS}

do-build:
	cd ${WRKSRC} && for library in					\
		libschily libdeflt libfind librmt;			\
	do								\
		cd ${WRKSRC}/$${library} && ${SMAKE} ${MAKE_FLAGS};	\
	done
	cd ${WRKSRC}/star && ${SMAKE} ${MAKE_FLAGS}

# Process tables in manpage
post-build:
	cd ${WRKSRC} && if ${TEST} -f star/pkgsrc_tbl.done; then :;	\
	else								\
		${TBL} star/spax.1 >star/spax.1.tmp &&			\
		${MV} -f star/spax.1.tmp star/spax.1 &&			\
		${TBL} star/star.4 >star/star.4.tmp &&			\
		${MV} -f star/star.4.tmp star/star.4 &&			\
		${TOUCH} star/pkgsrc_tbl.done;				\
	fi

do-test:
	cd ${WRKSRC}/star && cd tests ; ${SMAKE} ${MAKE_FLAGS} tests

do-install:
	cd ${WRKSRC}/star && ${SMAKE} ${MAKE_FLAGS} install
	${INSTALL_DATA} ${WRKSRC}/star/star.dfl				\
		${DESTDIR}${PREFIX}/share/examples/star/star

.include "../../mk/bsd.pkg.mk"
