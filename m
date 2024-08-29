Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6157318D63A
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923632; cv=none; b=JnXtb+A+3abSmUfNjeOuOf8T4w4ZQDhSrT++t/d4GQiVYkmiaJccCvY7twoGb8i1/Gj/pUrHGpsnP1qaHheSms6nuauRG/cI1lPagab+hfivaVRzMiCV6eeplwLykOlf9Fbacc1GC7xDh/4DOkdvSTTy8w5H3fcZE8FMjhjvBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923632; c=relaxed/simple;
	bh=g7vPCp6T2KzSgyaMPE1ZnoCnxjUR5ijKx+yapczFdz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/HasBjee6wgHRaaPsWK79WF5h2oUms8KLZ+ikn6rL+ID2GH++UVS9js8VkqnLgRCsMvZNIlBKsrWoblrkQbyF/kavVVEowgaYUKGiC5unNul02ax0h5QJM0qy714VzDZ+5RUZoPc/bG40/ngEa03gMK2YDbz7pY94Y9OWrGLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brL7AXNm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brL7AXNm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71423273c62so369083b3a.0
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 02:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724923631; x=1725528431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvjn3LozyX7PzUcM0O+kSIxcuZqvkXVUv2cAp4pQJyY=;
        b=brL7AXNmg9nXMEq6s8ImrbfmpeBsTv8hW/fO5cyn6Qw1Pp9PQGxyfXEn2+MEXrElWB
         GntyYoALIohNO9bP7sOgi9+HI5biNli1GpoqS9Ud2LHGYogoa24xIuW/9rdPyI2ls0pr
         wx/g8mzYlVUC7rgUxPofwazZXmCLrnC66MvvXHHGB9BMyGLuAsHezWKRkNQY9VZWWzNl
         eY8Ji8lYjcElS5P0WLK0Yti6uTbHUKJo/Ak9SgAhzjJ1vYBB5nPBEDyLto5jZ1dYmORA
         G+l7UYAcuBs+Uv3CNRqkDmPyPmB334rzGXgr4PVJq0D1X47Nor8cQyQgGlUaK2j2Sk7Y
         A5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923631; x=1725528431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dvjn3LozyX7PzUcM0O+kSIxcuZqvkXVUv2cAp4pQJyY=;
        b=Qn+p0tS3MFIVVyteeOoJH69bVX/L6AlCNEa6jf7VntZgqar/JC0aTv2jvwJtLXn2E3
         9zWnrJaACCSYsLCG3LHDIW/cKPcIRt8kzv3wjHdNclcB6K1HHz2qApCwDr3DifUaMzqB
         Qf1/ao/Cqh7F9gMcW10u1g+qYIOpL1fMRIJX0OtB3HSrXTwUPH3knvtHVW2rDzO22FJX
         XZoCh90KEC5dr5cb0UNvPzFwSJCDGmXjkcbdAtVurkR5LbBsswTyDOoSjDp5VLHsabdN
         SI4jsge8OG/nrrGDCNWe1emmBP4EKzCX1IjqdkbY5IQ0/g/cnkAe1uV5cS5dPibG5SLs
         +eZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPKowvE6vnrTh7mW91i//xms5mZ7+a3plamSH8UBasUB+ZGVGnlfuUeYXGsuL+jpinTxOa2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsiBYwfmwd24F7qQ75lA+tA+a4nbwLSaE9KzJvLRT0QmMnPARW
	PmETC/7YQpvaskXOMuNI+R60kGYcPRZ0nM9NUEN2KwE1ju4HYe3C
X-Google-Smtp-Source: AGHT+IHH9msDkUh4C+HrO5ERn2jIh+PFRRJ3FprkC7wSKj6bergnvBcBclkRVm7iRpcIrBtCX3ESng==
X-Received: by 2002:a05:6a20:c78e:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cce0fea52bmr2077586637.7.1724923630574;
        Thu, 29 Aug 2024 02:27:10 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20515552b6dsm7469245ad.249.2024.08.29.02.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:27:10 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] Add AIC support for A7-A11 SoCs
Date: Thu, 29 Aug 2024 17:03:10 +0800
Message-ID: <20240829092610.89731-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is a second attempt at adding support for A7-A11 SoCs to
Linux, it is based on a previous attempt, which you can find at [1].
However, there have been quite a bit of changes.

First, the boot process has changed, now, the boot process includes
a "1337" version of checkra1n [2], a custom PongoOS binary [3], and
a modified version of m1n1 [4]. The kernel is appended to m1n1 and loaded
by it.

This attempt also supports SMP, which has uncovered some differences
in the A7-A11 AIC. Namely, although A11 supported fast IPI, it only
supported "global" fast IPIs via SYS_IMP_APL_IPI_RR_GLOBAL_EL1,
and SYS_IMP_APL_IPI_RR_LOCAL_EL1 does not exist on A11. As a result,
there are now three feature levels:

A7 - A10: No fast IPI
A11: "Global" fast IPI
M1: Global and Local fast IPI

Each feature level is strictly an extension of the previous, for example,
M1 will also work with the A7-A10 compatible. As a result, the
modifications only includes if'ing out of features, in order to make
the existing driver work on older SoCs.

The A10(X) contains P-core and E-core pairs where only one core in each
pair may be active at one time, controlled by CPU frequency. A RFC patch
will be posted to disable 32-bit executable support on A10(X), as it only
supported 16KB page size anyways. However, such a patch is not required
to run AArch64 Linux on A10. At worst, any attempt to run 32-bit
executables will result in the process crashing.

Initial device trees will be posted in a later patch series, likely when
the AIC modifications are accepted.

Asahi Linux downstream kernel note:
These patches will not work with the Asahi Linux downstream kernel,
as these earlier SoCs do not support state retention across deep WFI,
which results in the CPUs going back to RVBAR on cpuidle.

[1]: https://lore.kernel.org/asahi/20221007200022.22844-1-konrad.dybcio@somainline.org/
[2]: https://checkra.in/1337
[3]: https://github.com/asdfugil/pongoOS/tree/mini
[4]: https://github.com/asdfugil/m1n1-idevice

Nick Chan (3):
  dt-bindings: apple,aic: Document A7-A11 compatibles
  irqchip/apple-aic: Only access IPI sysregs when use_fast_ipi is true
  irqchip/apple-aic: Add a new "Global fast IPIs only" feature level

 .../interrupt-controller/apple,aic.yaml       | 15 ++++--
 drivers/irqchip/irq-apple-aic.c               | 49 ++++++++++++++-----
 2 files changed, 48 insertions(+), 16 deletions(-)

-- 
2.46.0

