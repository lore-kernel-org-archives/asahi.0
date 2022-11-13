Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B57472
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 23:38:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id k15so9563604pfg.2
        for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 15:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Vnx3d3UtkT0/AOZKRIdRL+527l3FrSpUvOUpZvyUTU=;
        b=blKoO8j4ehhHyUaUop6u8o1NYssyGklb1fBQii6ccnOuJB1GCx33PlNv2pQ6LgZI8x
         yISfq6eaSXYTJlHY+oiMASEfAsGDtzNU9YoQHYLgcLJwkigMAo8d44e88qqINeTXFUf6
         EY17RqbzjzSnBB/1zMS6KU+5cvHFS/NuAByEiTBwPcITmnKq+XZJJfhNmzxBj2upsOoB
         mBBMqWpXDdFp5CF4Yg7sQCbBlpOG6ahyaKbKeSN3hasbb5HQo4Y7oq3+8Elag3oVhR8p
         15lFmO9KRVte7WIyXLFJFlmbJHsvAxSwdpaIyAr46BEoPfbnqHAsXO2+oRB77vTpL4Hg
         xN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Vnx3d3UtkT0/AOZKRIdRL+527l3FrSpUvOUpZvyUTU=;
        b=wTBCiGDmJn8bn4v9N5YNS6VilJu3NigTMqiGxExFI8xJg9uA+quJg/FJ+5FkwbaJM1
         VJlMrnqRLFkPCAT8dP6RoML9n4hYNcxhOWP6l/CK8DhoAUIaBn85TkJOEe2bRPFu9/Om
         LSd5hZDolw0GelBP/rtYmUhz+vYJNqHy4LKTECVGPZXMzqex4YYaWbQudxbWOBeee1M8
         gQihETh0dH8GZnWBXFkhM4QNnlBnnPSbdk+TTtun5XbcySEXV3ZlS277u7XcHFV9oHp/
         Lla6OPHAVjtp3IZ1nQDQRsh4EQgdAXOSPcSDfTwYLchTTdOWfRiprghTvsqrWXchmKKx
         5Y5A==
X-Gm-Message-State: ANoB5plfGgLaUA35xZKLL2HAf/r7XnQjEaOh/J3/VU3HjudJRsEWzv1+
	JyLTiAN5JZSn76H8z9kgAlw=
X-Google-Smtp-Source: AA0mqf5xzbKMvhosYmjeFdvvr2ztvRpv/6HUe8EXpW13Kz5dAstFCQ6bhMPlCpEcQuOEVXLI2Cfr7Q==
X-Received: by 2002:a63:165f:0:b0:439:ac9b:37a6 with SMTP id 31-20020a63165f000000b00439ac9b37a6mr10000824pgw.591.1668382702061;
        Sun, 13 Nov 2022 15:38:22 -0800 (PST)
Received: from nicks-air.lan ([2601:647:5700:fdc:a9a7:4597:ad5b:e304])
        by smtp.googlemail.com with ESMTPSA id ip4-20020a17090b314400b00212cf2fe8c3sm8890336pjb.1.2022.11.13.15.38.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Nov 2022 15:38:21 -0800 (PST)
From: Nick Desaulniers <nick.desaulniers@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Nick Desaulniers <nick.desaulniers@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Guo Ren <guoren@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] scripts: subarch.include: fix SUBARCH on MacOS hosts
Date: Sun, 13 Nov 2022 15:38:09 -0800
Message-Id: <20221113233812.36784-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.37.0 (Apple Git-136)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building the Linux kernel on an aarch64 MacOS based host, if we don't
specify a value for ARCH when invoking make, we default to arm and thus
multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.

This is because subarch.include invokes `uname -m` which on MacOS hosts
evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,

This allows us to build ARCH=arm64 natively on MacOS (as in ARCH need
not be specified on an aarch64-based system).

Utilize a negative lookahead regular expression to avoid matching arm64.

Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
This is only part 1 of
https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb340355f471c1dfe95a
I'm still working on the rest...

 scripts/subarch.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/subarch.include b/scripts/subarch.include
index 4bd327d0ae42..aa130286b627 100644
--- a/scripts/subarch.include
+++ b/scripts/subarch.include
@@ -6,7 +6,7 @@
 
 SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 				  -e s/sun4u/sparc64/ \
-				  -e s/arm.*/arm/ -e s/sa110/arm/ \
+				  -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa110/arm/ \
 				  -e s/s390x/s390/ \
 				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \
-- 
2.37.0 (Apple Git-136)

