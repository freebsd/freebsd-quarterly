## Universal Packaging Tool (upt)

Link:	[Upt repositories](https://framagit.org/upt/)
Link:   [Upt itself](https://framagit.org/upt/upt/)
Link:   [The FreeBSD backend](https://framagit.org/upt/upt-freebsd)

Contact: The upt mailing list <upt@framalistes.org>
Contact: #upt-packaging on Freenode

The Universal Package Manager (upt) is a tool designed to easily port
software from common upstream package archives (such as
[PyPI](https://pypi.org/) or [Rubygems](https://rubygems.org/)) to
various operating systems, including FreeBSD, of course.

A lot of similar tools already exist: pytoport (which creates FreeBSD
ports for PyPI packages), gem2deb (which creates Debian packages from a
Ruby gem), and many others.

The main difference between these tools and upt is that the latter uses
a modular design, allowing it to handle packages from many sources and
support many different operating systems through plugins. You may
try upt by installing sysutils/py-upt, sysutils/py-upt-pypi and
sysutils/py-upt-freebsd. Suppose you would like to package "upt-cran",
which is hosted on PyPI. You could do it like so:

```
# upt package -f pypi -b freebsd -o /usr/ports/sysutils/ upt-cran

$ tree /usr/ports/sysutils/py-upt-cran
/usr/ports/sysutils/py-upt-cran
|-- Makefile
|-- distinfo
`-- pkg-descr

$ cat sysutils/py-upt-cran/Makefile
# $FreeBSD$

PORTNAME=	upt-cran
DISTVERSION=	0.1
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	python@FreeBSD.org
COMMENT=	CRAN frontend for upt

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/XXX

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}upt>0:sysutils/py-upt@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests-mock>0:www/py-requests-mock@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
```

Note that the Rubygems and CPAN frontends are also available
(sysutils/py-upt-rubygems and sysutils/py-upt-cpan).

Bug reports and comments about this new tool are welcome.
