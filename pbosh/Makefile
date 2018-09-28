# $NetBSD$

DISTNAME=	schily-2018-09-26
PKGNAME=	pbosh-20180926
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=schilytools/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://schilytools.sourceforge.net/bosh.html
COMMENT=	The Schily Bourne Shell
LICENSE=	cddl-1.0

MAKE_JOBS_SAFE=	no

USE_TOOLS+=	tbl
TOOL_DEPENDS+=	smake-[0-9]*:../../wip/smake
SMAKE=		MAKEFLAGS= smake

PKG_SHELL=	bin/bosh
INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1

.include "../../mk/bsd.prefs.mk"

# Shared platform specific code for schilytools (provided by smake package)
.include "../../wip/smake/Makefile.common"

do-configure:
	cd ${WRKSRC}/inc && ${SMAKE}

do-build:
	cd ${WRKSRC} && for library in					\
		libschily libxtermcap libfind libgetopt libshedit;	\
	do								\
		cd ${WRKSRC}/$${library} && ${SMAKE};			\
	done
	cd ${WRKSRC}/pbosh && ${SMAKE}

# Process tables in manpage
post-build:
	cd ${WRKSRC} && ${TBL} sh/sh.1 >sh/sh.1.tmp;			\
		${MV} -f sh/sh.1.tmp sh/pbosh.1

do-install:
	cd ${WRKSRC}/sh &&						\
		${INSTALL_PROGRAM} ${WRKSRC}/pbosh/OBJ/*/pbosh		\
			${DESTDIR}${PREFIX}/bin/pbosh;			\
		${INSTALL_MAN} ${WRKSRC}/sh/pbosh.1 			\
			${DESTDIR}${PREFIX}/${PKGMANDIR}/man1;		\

.include "../../mk/bsd.pkg.mk"