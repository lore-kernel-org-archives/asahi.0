Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4663A6418
	for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560011; cv=none; b=HHViJdr3grmMJvZhhmtYhih5n/DM3vyA9PAKla7n0IqqPwBjDixiv4awhzXVOpNzuncBwpSsTtE82nhBruXwIprfF4vqowOIl1fj4ejALReICJ+NZ2Sjt7voXmTm0CoDMYvRfQp3OEeTa1tM/7z2Fk45uvVVrPg3nmxWjZvVu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560011; c=relaxed/simple;
	bh=7K3qF4MHbnXOzGNTTxNufyBZaxyiQ5GnnlzSoo75z0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwpAK7MjjY6yb+JNyBK93MlTms6ykG5zbJFwcHXeqjkYh0cAB8HE1gXkZgCq8+DrVLQfkMVJyUnXpTd0Zjx3BB8BEErZZ2fDqDLgXA+WziTW2IB5VFcNnruTMsumKDiaaafTEELA8SOVSwznyQ6RHlF9R6mHMOHVgxPelv2mKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dl9QP3TV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dl9QP3TV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf452def93so29620425ad.1
        for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560009; x=1788164809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgyNog9WpL8OyqKZAIeKVr+B+H34q6AdaVPTiDSA/FQ=;
        b=Dl9QP3TV64FA1Q92U5AM2Lvc/SaOqYYwPGXf9QqqaZ6RjVLgW035Btsh6wW2ptd0o1
         UlzJE3jZoaAk+e6ti9J16aYSAVdiOCyaWIeTb+G2WW4qCFtR8ASFvO3uNCQRfv5zYQex
         2A4bXTF61fi9LmQiandSMgd5ES6l57clZa1krCEaB9DKbQmv/s+edgWwMCOI4VLhPzyg
         5I+8LFDYc9MSbJZJPPxmSGwAUyozQJ97DLvcNpZNilfupP8bRwW56gklaD36aQdDATMu
         far1htHEBMTj2NqsoDmcDUZq/ksMdNrEc8ZwnlhfJe7l2hhJxJTJKgVkgwqPOYkt7EBz
         5loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560009; x=1788164809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgyNog9WpL8OyqKZAIeKVr+B+H34q6AdaVPTiDSA/FQ=;
        b=oSF8TeGAuICcoeTjGHr4SBXgB3//vzQiZX2Fw53sQTv+6bWHU9tDS7108LqdTP7kcV
         4d4vmRtNk8zJWHhEu88RVu/eZkmZzXCvfuqVRux6eAs4lssJwk4o/Yjm0qO9VwW0m340
         oFcw7qeslxPWfPDtakQfJltqAthbjU5/KNGM+Tv5fAfrm7GVdE9mddjYOUY/9kTXgOV8
         HWNFvmTjacbPRGKuS603Xi5QdNXW1JLhZuGK5lmt766MJ1+7c7rDGaIojvN+3HZvYe2b
         ossFuq8nVnPsos4JNJaK3vOL5LTavKxEFOTHjQOEemmNy+NAS4ZhrnQSnA7AhQe0Z0gF
         a5rA==
X-Forwarded-Encrypted: i=1; AHgh+RpC1GKbOe4UymeVLXuxiMNIJMT35eQv0st/DdgRIJGnJu+sxsbDim10g0zrdijD1j14FaCuYw==@lists.linux.dev
X-Gm-Message-State: AFuF++kbP+r5orEsGlpuOfGIhmSeIFPqwxQUyI295gSfOtOHgu7xoIcM
	+xEnDjCLOXMAXUqptkSANtTZh+xf9yFviHqAeFwRiWZu+adl4xmGuRYX
X-Gm-Gg: AR+sD11s/LnkojT4NhxZlH7jRsxt+IpdJvuQqRn0xEpjrnVr7W3htvAfLSZ8e2XQvF4
	IJychIGg98gA+h4TJ1jKkkOMqV7n+lNuFYGnUKrYxZvMfyZa0t28U/GJs/wGBUbhtKiTAKkav1N
	KsVW+rTpS/3RaSzYC5VL04ijEb8dfpUSgncjxKdYObHJeIgfY7PoQo/09hWC8Q7qymZq37SA3qf
	t/OD/iz8tCKPoDCl2Y5CYZAtbZQtgszjfvlvD5UQu14NXSnYRyWyiXVNmtdPgnslPNfa7RSV6PJ
	+tagypF8TtH86mCHPp1Puocn0StVpySYnpeUQ1DiSf0TvETwCut2Wt++wmikJLjin8FZdwdK47K
	Zl9UO8Fy7BbgBKIpU3yi85o9/VeP5Lj0wM9BIAAcAq0msADdvnKIdECpi6dF/TdjpbI0WmJk97e
	FbKTUMYPU5DwRf87hUsXSkmUkFcB7N0bpARcxDEuTBR86YbfTvu0ckQfPHdvcmf5gNdI0/o4uJO
	cWcV683BC3VFZpR22VJSj3dgck+lygUSaQyGLmd5DucP6kEIy0ufe6+H9Bi3KWqhbAPaYE9uURA
	XbjBRyeipCkp6h0TyxDQTYYrCyjZrxrX2Oev+KCCbVJw9AakPZQuXKCAZdz4b1II/J/hfmVUuJ4
	/60/Kaif1Opwu512QiasVh+cClreqk4uOBGyGo59UM2Ln64c=
X-Received: by 2002:a17:90b:4ac8:b0:380:ce69:2669 with SMTP id 98e67ed59e1d1-395a0510f96mr35860154a91.9.1787560009190;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:26:48 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/4] soc: apple: rtkit: harden syslog shared-buffer handling
Date: Mon, 24 Aug 2026 14:11:36 +0545
Message-ID: <cover.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the syslog hardening into focused changes as requested. The first
patch fixes the SYSLOG_INIT reinitialization leak. The second prevents
zero-sized messages and out-of-bounds shared-memory copies. The third
corrects the entry-count boundary, and the fourth rate limits validation
warnings controlled by the coprocessor.

The index-boundary change has not been tested on Apple hardware running
Linux. Asahi m1n1 describes the initialization field as COUNT, consistent
with the kernel's syslog_n_entries name, but patch 3 is kept independent so
it can be reverted without removing the shared-memory bounds protection.

Testing:
  - arm64 GCC build of drivers/soc/apple/rtkit.o with W=1 in Docker
  - scripts/checkpatch.pl --strict on each patch

Changes since v1:
  - inline the one-use shared-memory bounds check
  - use == 0 for the crashlog copy and < 0 for syslog copies
  - split the SYSLOG_INIT leak fix into patch 1
  - split the idx == n_entries change into patch 3
  - make the zero-size guard independent of the leak fix
  - rate limit existing malformed-syslog warnings in patch 4
  - rebase onto upstream commit 0a0d1d55dad5

Laxman Acharya Padhya (4):
  soc: apple: rtkit: free syslog buffer before reinitializing
  soc: apple: rtkit: bound syslog copies to the shared buffer
  soc: apple: rtkit: reject syslog indices outside the entry count
  soc: apple: rtkit: rate limit malformed syslog warnings

 drivers/soc/apple/rtkit.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 26 deletions(-)


base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.51.2
