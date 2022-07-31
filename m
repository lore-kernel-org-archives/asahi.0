Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5915AD
	for <asahi@lists.linux.dev>; Sun, 31 Jul 2022 06:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 2824842597;
	Sun, 31 Jul 2022 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1659250788; bh=sMZiOPCA2blsp3dIdFuPC1F5P0eAqfkl2hGZxKNmOag=;
	h=Date:From:Subject:To:Cc;
	b=GLnJpcZRejcOG54zx2QXW76t6a18gXBBmFZS7mEEenCCTXH2Tm4pgyjxrYERWWfnG
	 EinSjhJtTiKsoPS5O8BQrl4wMgCB0u0zlUw2OBQzd3NAL9KhZE+qOHltoRbahqfUTi
	 3U1vV53xubeKs5ej6SXk/bMHP4BjBwIPBY1XIIikohpzpSn+qONgE69OaxN+xFvIZr
	 +1vjbbd78tKeBIh5JSO+qDlvBX1vyeKkY7WuVnzc6LpAnbgL+4oVU5l+7yKHI5zlNc
	 He2UybV5ujMOkjcitw7pCSyL9SuUOziaFPlLpOk2hps7sUNMBaOi7ogNqDaSLpkc5m
	 rZrzFJj4uuaFA==
Message-ID: <308defdf-8873-63ed-dc9c-a88cd7a3cc2f@marcan.st>
Date: Sun, 31 Jul 2022 15:59:45 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC MAINTAINERS updates for 5.20
To: SoC Team <soc@kernel.org>
Content-Language: es-ES
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi SoC folks,

Please merge these MAINTAINERS changes for 5.20.

This one is trivial, so hopefully being this late won't cause you too
much trouble... My apologies.

-Hector

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-maintainers-5.20

for you to fetch changes up to 57a2d0c1b27dd0a92d4d22818176e7f53eed3104:

  MAINTAINERS: add ARM/APPLE MACHINE mailing list (2022-06-21 14:46:36 +0900)

----------------------------------------------------------------
Apple SoC MAINTAINERS updates for 5.20.

Just one patch adding our shiny new mailing list to the relevant
section.

----------------------------------------------------------------
Sven Peter (1):
      MAINTAINERS: add ARM/APPLE MACHINE mailing list

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

