Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDB15AD
	for <asahi@lists.linux.dev>; Sun, 31 Jul 2022 06:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 9ED0B42597;
	Sun, 31 Jul 2022 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1659250677; bh=wo3zwsLqb7d3BVzIjjvK8kaM4Ku2pHX15rGYZj2LALE=;
	h=Date:From:Subject:To:Cc;
	b=LKLnjpm847nv+/hrh2NmToLOvXPXobw6H5DtHtpaInUqpQvef8O5rDsufwb+3YBgW
	 8XyFYxc835//GAaKOh241RbX8MjFHZUoexFs21f6JAAZi5B0fPf0iRehmnUGhLx1t0
	 fS2DPpOwSj18BdJDb8mkVjBEdlaiQoSYtyvdsZ//aQ8mpWfn2VSSiGnp9xH590yzxm
	 0yerYY9qPFiyth+xuUfbonMYyMY9P9WqE4ID5nddAfhJeLSBmuboICSV1ZdNk/jOrC
	 UbJl5s8ROM/hb2RoiqDKt7DS1Izes0rTggaSk3Rlavejcb9Tl6cWkauZDqpvZq+72w
	 PgzdEgNUn70Eg==
Message-ID: <6de8649c-9795-54a1-fa45-8dd50355061f@marcan.st>
Date: Sun, 31 Jul 2022 15:57:53 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC DT updates for 5.20
To: SoC Team <soc@kernel.org>
Content-Language: es-ES
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi SoC folks,

Please merge these DT changes for 5.20.

I know I'm late with this one... hopefully it won't be too much trouble,
since it's quite trivial.

-Hector

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-5.20

for you to fetch changes up to 5316d73ba81b5dd7fe5ecfcd4ad494a0a68ae138:

  arm64: dts: apple: t8103: Add ANS2 NVMe nodes (2022-07-31 15:38:42 +0900)

----------------------------------------------------------------
Apple SoC DT updates for 5.20.

This round just adds the NVMe controller nodes, since that driver is
finally upstream. Includes one related power domain fixup.

----------------------------------------------------------------
Hector Martin (1):
      arm64: dts: apple: Re-parent ANS2 power domains

Sven Peter (1):
      arm64: dts: apple: t8103: Add ANS2 NVMe nodes

 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi |  7 +------
 arch/arm64/boot/dts/apple/t8103.dtsi      | 34 +++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 6 deletions(-)

