Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E825C71A
	for <asahi@lists.linux.dev>; Wed,  9 Apr 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189892; cv=none; b=TlRrpO3Vil61AJi56np92LnJfwrh51P/iqBBeMKOBCeImf6+UAb2k0BSM5k5GE4+9XX2xksN0PDIvbg+hzkVC10Z4d5k3DJXkas/I+zTop20IzeUQw4g9hkJPsDyfVEelAbCfpi0YqmEbKO23VwG8KUNQdyISp+tG5fiNls9rxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189892; c=relaxed/simple;
	bh=ZHkYUtq+ZTCpwq0IH2s1bsran6xW4o5sjSqv/wukXdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mLGA5aalmUSSOpfkhPuq1DoRxsabzEwNRVAKwSptmPWW451vbRO5F4rShukzteELB/wOmCRF84hZyyp2LROLpedh4WQAoQhLuRG51ygssRPKw8HkLN+N57x0Z1FIPrBWZ+xunWxvqCuYTCq4pVJlX21OIfJZ6OJ36UyMUYJvTr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=temperror (0-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=cOM5bYmq; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="cOM5bYmq"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1424843587;
	Wed,  9 Apr 2025 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1744189886;
	bh=ZHkYUtq+ZTCpwq0IH2s1bsran6xW4o5sjSqv/wukXdo=;
	h=From:Date:Subject:To:Cc;
	b=cOM5bYmqWmgAskUPlVB+dmvImmb9mSfHuu+IB3BBCTV7Cj5bymfJVD8tK/El4YG8m
	 3rRdM55QisQk3+day2odXgudyQh7oUhHTJri90hVLqRa1opJx0spVnGqwDJMtmDRzF
	 LUXsP/muHT/zq+NKhOrg6IexrU8X7VtKXwK6c51mn0rD4q2LoBXAfq7eltk0z8Fivg
	 DRjMYctZ2RJIP1M0ORjl6xBIOgKBWSusebRS9+mfPPCp5gbToepto17brW6LNj52eD
	 1mIscjILXS89oj6mGSLkhcY5J9+A9U3U+0QSJxyYTSQDg4+vAbtRBVhvf0f5SaAHuP
	 UdxgoO0lODK/g==
From: Asahi Lina <lina@asahilina.net>
Date: Wed, 09 Apr 2025 18:11:21 +0900
Subject: [PATCH] mailmap: Update email for Asahi Lina
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-mailmap-lina-email-v1-1-265d05848ae3@asahilina.net>
X-B4-Tracking: v=1; b=H4sIALg59mcC/x3MTQqAIBBA4avErBvQ7Ie6SrQYaqwBtVCIILp71
 vJbvHdD4iicYChuiHxKkj1k6LKAeaOwMsqSDZWqGlWrHj2J83Sgk0DIn9BqbYlMazq1QA6PyFa
 ufzpOz/MCWrokrmQAAAA=
X-Change-ID: 20250409-mailmap-lina-email-f11faa36370d
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 "open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>, 
 Asahi Lina <lina+kernel@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744189885; l=986;
 i=lina+kernel@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=NzCLSQigXTsgi0vL8KVztjjLxdP7cijDZoMvqvpqbBg=;
 b=7407E684pwpfEf0jIVU+rWYnZeZQMSUF9fRizjxFb3u5inJS2yr5uwmVC/Hzf/VdQcQBWH1Vf
 cLNnVKUueU8A+v64BOs2n3X5UuzsZRHoXxQn/CXecx2fvaT8zqKiuLg
X-Developer-Key: i=lina+kernel@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

From: Asahi Lina <lina+kernel@asahilina.net>

Add an alias so I can more easily filter kernel-related emails.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e231778cdf0ee45fe2d2cba1a554965685..8f0cc0b08ed0c841c6927d23cd9be6b1b4776962 100644
--- a/.mailmap
+++ b/.mailmap
@@ -102,6 +102,7 @@ Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
 Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
+Asahi Lina <lina+kernel@asahilina.net> <lina@asahilina.net>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
 Asutosh Das <quic_asutoshd@quicinc.com> <asutoshd@codeaurora.org>

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250409-mailmap-lina-email-f11faa36370d

Cheers,
~~ Lina

