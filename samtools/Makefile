# $NetBSD: Makefile,v 1.1 2018/05/07 18:37:31 bacon Exp $

DISTNAME=	samtools-1.9
CATEGORIES=	biology
MASTER_SITES=	${MASTER_SITE_GITHUB:=samtools/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	bacon@NetBSD.org
HOMEPAGE=	http://www.htslib.org/
COMMENT=	Tools for manipulating next-generation sequencing data
LICENSE=	mit

USE_TOOLS+=	autoconf automake autoreconf gmake perl:run
GNU_CONFIGURE=	yes
REPLACE_PERL=	misc/*.pl misc/plot-bamstats test/test.pl
REPLACE_PYTHON=	misc/*.py

pre-configure:
	cd ${WRKSRC} && autoreconf

.include "../../mk/curses.buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../wip/htslib/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
