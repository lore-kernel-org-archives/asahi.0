Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E51362
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 04:38:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id B050842165;
	Wed, 11 Jan 2023 04:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1673411903; bh=HfFhuO/foSzEbmya21quSWIKZF8twzaOgyIjDrYqKHo=;
	h=From:To:Cc:Subject:Date;
	b=P8chu566SCCEyb4pTVwA4dMqw4vFrkbsl9qjBm/MzvlDIJeDc/vjNar8nvW82f2Fa
	 7MqX5rOJfyHjU3IOUkuYSN3QD+WiOGBXyp2nceOLmd3PfPilW+4wleApLWjewq2MGc
	 jINYTXgCFgU6VUHeWxSNqA1phlmiBK3HjM6LILNs7ewfDLruFdpI4tulULomJCFX4k
	 NitLYn4zFL13bDuf7cqnRSUUW9ci5pbejzZpiBRPRWBU9uLmo1IoYGMPd+cah930Gh
	 PKF9f2COtxJiPou2h65K5B6FdLx2z17IXuMAhXRdyJAdU7t5MeVg1iA+w/xqswp4bb
	 TnaO+WaEiSaxA==
From: Hector Martin <marcan@marcan.st>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Eric Curtin <ecurtin@redhat.com>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/2] nvme-apple: Fix suspend-resume regression
Date: Wed, 11 Jan 2023 13:36:12 +0900
Message-Id: <20230111043614.27087-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c76b8308e4c9 introduced a behavior change in the way nvme-apple
disables controllers, avoiding a disable in the shutdown path.
Unfortunately, the NVMe core does not know how to actually start up
controllers in the shutdown state, and this broke suspend/resume since
we use the shutdown command for device suspend in nvme-apple.

Additionally, nvme-apple was also checking only for the disable state in
the reset path to decide whether to disable the controller again, and
just having the controller shut down was triggering an unnecessary code
path that broke things further.

This short series fixes those issues and makes suspend/resume work on
nvme-apple again.

nvme-pci is, to my knowledge, not affected since it only issues a shutdown
when the whole system is actually shutting down, never to come back.

Hector Martin (2):
  nvme-apple: Do not try to shut down the controller twice
  nvme: Handle shut down controllers during initialization

 drivers/nvme/host/apple.c |  3 ++-
 drivers/nvme/host/core.c  | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.35.1

