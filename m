Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A712F43
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 11:41:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 5D70941E2F;
	Mon, 28 Nov 2022 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669635685; bh=YzTkgZL151xpivSuy+2SYaQn1Sj6M2+eEQlGgH8Ue3c=;
	h=Date:From:Subject:To:Cc;
	b=IBsiMw7xYzzdNgwCYXMTK9NZqcEP62rYRbDUmCsf7G2LGAMA6ddmSyIWhwCEImyJy
	 hPu/5djnVSEsBkj5cqx598fdyMfcKDbxc5Skp9DfIxqP4kF5/ml0Wz8Z48FWRFEfix
	 YvGJCcM9W59NfD1NTBKTtRgpYTZUZJlMrImQcF2EdnjiJRiCnwhBn1VJNW2yuUTiFC
	 WUUSUYPd1sS7VbV/MqraaK2xPWEAnUpv+RInZSyVNrlSCD/fXMMZoVoXq2g17tYeti
	 xZqaO4+1YbSPBWZ1oNbqlqVYqiSI3/KAVMZbxb8rXDyKuj4ep/6Y/wJCS5mENK14nS
	 RG8G3fjJCK1Mw==
Message-ID: <57f84134-8645-35f6-2427-ee683800c413@marcan.st>
Date: Mon, 28 Nov 2022 20:41:22 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC RTKit/SART updates for 6.2
To: SoC Team <soc@kernel.org>
Content-Language: en-US
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi SoC folks,

Please merge these RTKit/SART changes for 6.2.

This batch just contains two correctness fixes for issues reported by
the kernel test robot.

-Hector

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-rtkit-sart-6.2

for you to fetch changes up to 5acf07ff25f0c1c44105e6b8ebf88c55a0a04d2f:

  soc: apple: rtkit: Stop casting function pointer signatures
(2022-11-28 20:34:09 +0900)

----------------------------------------------------------------
Apple SoC RTKit/SART updates for 6.2.

Just two minor correctness nits reported by the kernel test robot.

----------------------------------------------------------------
Sven Peter (2):
      soc: apple: sart: Stop casting function pointer signatures
      soc: apple: rtkit: Stop casting function pointer signatures

 drivers/soc/apple/rtkit.c | 7 ++++---
 drivers/soc/apple/sart.c  | 7 ++++++-
 2 files changed, 10 insertions(+), 4 deletions(-)

