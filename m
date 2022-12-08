Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556376ADF
	for <asahi@lists.linux.dev>; Thu,  8 Dec 2022 16:25:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 3634541F72;
	Thu,  8 Dec 2022 16:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670516729; bh=4RnokV0DnSVNFLMRUJNU+pP7138XjdHt4zeA1xbMWH8=;
	h=Date:From:Subject:To:Cc;
	b=O4aqOoSK6JFhVn8RY3hp/IIIOQLUbOB3IOJReCYEXn1xKGezudFuT6kvEgCLbSno+
	 vElIiQiC/5t9lpkNx2c/B/AIoF2+OBD+k4D+s4DNUoeudJe2QZVkAewBdGiKk9FViY
	 WxekwQYTgfl0KtLa3tVlqvTfBoe0l+Pai3JkqRT4m9srIRvfdXlwSwkMViGes6LOZ+
	 78QjhZRM8C3rZfa1qlqZaPLoypBrR6qpLVrUxJz0FG+HOru/2AN8LCNp9OJjbnm+Wy
	 xAexPOC0cy7cpwYUcdvpgkBna94Vhi9Z9o3kHyFpR2Nxo3RhOyc1KeYjpwMv1XQ1Nj
	 UoBUEth+5g+dA==
Message-ID: <488ad4e9-04dc-1774-3bbe-d313ef30f14d@marcan.st>
Date: Fri, 9 Dec 2022 01:25:25 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC DT updates for 6.2 (v3)
To: SoC Team <soc@kernel.org>
Content-Language: en-US
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi SoC folks,

Please merge these DT changes for 6.2. One last round this cycle :)

This batch ended up collecting a little pile of typo, style, and one
minor functional fix. It also includes the cache topology info for
t8103, mirroring the t600x change that went into the previous batch.

-Hector

The following changes since commit d32c1530c7230b756ca9a6b6cf92ce6e60788594:

  arm64: dts: apple: Add CPU topology & cpufreq nodes for t600x (2022-12-04 13:31:59 +0900)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.2-v3

for you to fetch changes up to 67327f125801f98aec9e2cf5e1df16cf493a065f:

  arm64: dts: apple: t6002: Fix GPU power domains (2022-12-08 14:37:29 +0900)

----------------------------------------------------------------
Apple SoC DT updates for 6.2 (v3).

One final update for 6.2. This includes:
* L1/L2 cache topology for t8103
* A bunch of typo, style, and minor functional fixes

----------------------------------------------------------------
Asahi Lina (2):
      arm64: dts: apple: t600x-pmgr: Fix search & replace typo
      arm64: dts: apple: t6002: Fix GPU power domains

Hector Martin (1):
      arm64: dts: apple: Rename dart-sio* to sio-dart*

Janne Grunau (3):
      arch: arm64: apple: t8103: Use standard "iommu" node name
      arch: arm64: apple: t600x: Use standard "iommu" node name
      arm64: dts: apple: Add t8103 L1/L2 cache properties and nodes

 arch/arm64/boot/dts/apple/t6002.dtsi      |  5 ++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 14 ++++-----
 arch/arm64/boot/dts/apple/t600x-pmgr.dtsi |  2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi      | 48 +++++++++++++++++++++++++++----
 4 files changed, 56 insertions(+), 13 deletions(-)

