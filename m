Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B122733B6FB;
	Fri,  7 Aug 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119534; cv=none; b=HIVMuXN4VVDH8/Deu7CPAeu2B0Ohi3QQbG6chgFKH2yU6LHPlTNIf4yG+EDQpzawE3R1jxc/J8DMIKAzSB+N/N5bxgcbdoaDN6kta7/udLYxZNU+73Nm89HuG5TkAJO3aeG268cPGZgdxFfFea9A9eNicFVZynq0syMOu0XY9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119534; c=relaxed/simple;
	bh=8P9tFu6IRyymLXeRwyYnFMXaE6qf29qhwLtHj5XLmMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIOi7QrqNTt5cDbVbNyE5y2Cwsd7M9uDR99TP8Ay//8Kijx7u+FbNFJ3DyGm5Lc4HA+dkqKxbFj7HNqfioY092HxnLkJ2G0M+dCOHHw9Au5gPcofAjFo/ao+j6CEaaMao872+3K9956Nd9hNG1XDE34q3U1ane1erNxVLMQIZcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsX6h+Qc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsX6h+Qc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E37F1F000E9;
	Fri,  7 Aug 2026 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119533;
	bh=zgSHsXQk29ui9Z+91QJ9ktuD4OjC/hGwUOW699BKQWQ=;
	h=From:To:Cc:Subject:Date;
	b=PsX6h+QcY2eV7aDOCo2ooJK+kXzqprGYPxw3vifWXV7J6m3aGX39KWv3IiG1M3ckw
	 US6zpsXZVjowWHuwiD52v/rimYUky6440s3g/YGrIVvE4Bb4MNgdtwXx8VcSGtaVV+
	 gqclCHeys4zIX373nZUrx2vbGOsVOinqere21yX578CnNvv8P4jnwpbJEgoPF3HQfS
	 AEcPJew8xgyW+vuWGVmh/X6kYooaqDjyiOe08nn0yA0TkmUJNP5T56qIKtmCfLejn5
	 VkGRcnp37T5Qw+BKzlVO46tXxhsGrZg+Y7nhFCW0yKWz9/ZhxrLOBvYxKJLlGT15ou
	 46jKcXN9t9rQA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v7.3
Date: Fri,  7 Aug 2026 18:18:34 +0200
Message-ID: <20260807161840.6011-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.3

for you to fetch changes up to fef9350c314bf089a11a62858261e6576ada867b:

  soc: apple: Add driver for Apple PMGR misc controls (2026-07-14 20:28:42 +0200)

----------------------------------------------------------------
Apple Soc driver updates for 7.3

- New driver and dt-bindings for Apple PMGR misc controls, which tweaks
  various global power related states and saves about 1W of power on M1
  Pro/Max/Ultra during s2idle.
- A small fix for device links in SART

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Pengpeng Hou (1):
      soc: apple: sart: require device link for consumers

Sasha Finkelstein (1):
      dt-bindings: soc: apple: Add Apple PMGR misc controls

 .../bindings/soc/apple/apple,t6000-pmgr-misc.yaml  |  45 +++++
 MAINTAINERS                                        |   1 +
 drivers/soc/apple/Kconfig                          |  10 ++
 drivers/soc/apple/Makefile                         |   2 +
 drivers/soc/apple/apple-pmgr-misc.c                | 181 +++++++++++++++++++++
 drivers/soc/apple/sart.c                           |   9 +-
 6 files changed, 246 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 create mode 100644 drivers/soc/apple/apple-pmgr-misc.c
