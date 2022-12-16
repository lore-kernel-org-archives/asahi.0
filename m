Received: from infra.glanzmann.de (infra.glanzmann.de [88.198.237.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9B20E3
	for <asahi@lists.linux.dev>; Fri, 16 Dec 2022 14:20:38 +0000 (UTC)
Received: by infra.glanzmann.de (Postfix, from userid 1000)
	id E3B717A80074; Fri, 16 Dec 2022 15:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glanzmann.de;
	s=infra26101010; t=1671199981;
	bh=P/F7ElgPU8wEr2EsVwByQ8u+HnmesvnY1MwlXbDTM4U=;
	h=Date:From:To:Cc:Subject:From;
	b=lkVqbIkwbXRIpYwG2h3PY0xfJrG9vGY90/dKBvbysLFPgHuopDiSk/v4W/9q5V/lW
	 wb/b6AZH79nvsgP1IFGqhtXzWuTNzbEPzGmKOicgfMfiYNPW63KIyrPNhUunTOpynP
	 d/9GWHluqvFHxoxMrTV1sJXSOBzERy+WMt+xhxEjY0nZ4Ecoxz29hYAi7C7WV8fS0/
	 51BqPaRCxgLnvQgntAFS7B1/hlRWO6NMKbpS4nbU/Zf7Mi9bc9FDiqPw7SzeQJfs8t
	 RHAKXu8P+HIsmxZbtUbwPYP7v9z/CoAaolfHo+FELZyD0oe5Ql7zQd/NMWSJ6SklyG
	 f+14gB38FdBUUH6TlRsS4/WqSr+oJaBzo/YZhKHgbhgjAfCPghfD96ZHOg6p9Wb15e
	 0haIB4INXNsX8SumXMNg2pZS9c+eKtmXcj/bLydoc5chYK7MLCBihbTHl/Hbp8Rf4b
	 BS3bzDawM7ym8YMAzdEetlelGAAF1Pt3e4x9c2dzvL6Qt1gWvrKteLgNha4nFpqe8g
	 OmEkRUqdX1lwkk/IF+juPNgXFRbTiKa7ulERhIxxGJeisIOZQ9CigYNgKpjQspLQUa
	 xF5H1UqaHebALBcK3suvR6ghhhjv1hcqgznl33WAhTTsFh0KBGhEJM9v67hLFvAcFO
	 g29UpRHT2MpuyRLL0XoYFUIE=
Date: Fri, 16 Dec 2022 15:13:01 +0100
From: Thomas Glanzmann <thomas@glanzmann.de>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: asahi@lists.linux.dev
Subject: libunwind 1.6.2-2.1 assumes 4k page sizes and crashes on systems
 with bigger page sizes
Message-ID: <20221216141301.GA3440195@glanzmann.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.8.3 (2017-05-23)

Package: libunwind8
Version: 1.6.2-2.1
Severity: important
Tags: patch
X-Debbugs-Cc: asahi@lists.linux.dev

Hello,
the recent libunwind8 update 1.6.2-2.1 breaks for architectures which have a
pagesize bigger than 4096 on arm64. The issue is fixed upstream. But no
release has been made with the patch included. libunwind8 1.6.2-2.1 crashes
Xorg on startup for systems with a pagesize bigger than 4096 on arm64. Linux on
apple silicon (m1/m2) uses a 16 KB page size.

https://github.com/libunwind/libunwind/commit/2d004eafc77f3c6a4bd9a44b1c35735273fd4e97

Please apply the above patch.

Cheers,
        Thomas

-- System Information:
Debian Release: bookworm/sid
  APT prefers testing
  APT policy: (500, 'testing')
Architecture: arm64 (aarch64)

Kernel: Linux 6.1.0-asahi (SMP w/8 CPU threads)
Kernel taint flags: TAINT_CPU_OUT_OF_SPEC
Locale: LANG=C, LC_CTYPE=C.UTF-8 (charmap=UTF-8), LANGUAGE not set
Shell: /bin/sh linked to /usr/bin/dash
Init: systemd (via /run/systemd/system)

Versions of packages libunwind8 depends on:
ii  libc6     2.36-6
ii  liblzma5  5.2.9-0.0

libunwind8 recommends no packages.

libunwind8 suggests no packages.

-- no debconf information
