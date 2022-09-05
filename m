Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628CB28EA
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 07:22:05 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662362517; bh=lOUdKjM63vhO0T+j6pqlxE6SWF9QKCLU2WE1cQBJyRw=;
	h=From:To:Cc:Subject:Date;
	b=pS74r3S2HWyehRNTdLfOqcK9jEH4nYjyagt9/59ATpMJfmOxHDnKLDKx5xmqPMrwE
	 sxRwijnBARH8L9WTFdwZ0+tPtGFnjmgQiWEIW46B9zBEo+93tR1RcHzurDHF3PzTAL
	 UbJapWahgPeJQUisyAsTyyTPNtlZ78lMF2AvUKeo=
To: Vinod Koul <vkoul@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dmaengine: apple-admac: Fix grabbing of channels in of_xlate
Date: Mon,  5 Sep 2022 09:21:09 +0200
Message-Id: <20220905072110.72094-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The of_xlate callback is supposed to return the channel after already
having 'grabbed' it for private use, so fill that in.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/dma/apple-admac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index d1f74a3aa999..6780761a1640 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -490,7 +490,7 @@ static struct dma_chan *admac_dma_of_xlate(struct of_phandle_args *dma_spec,
 		return NULL;
 	}
 
-	return &ad->channels[index].chan;
+	return dma_get_slave_channel(&ad->channels[index].chan);
 }
 
 static int admac_drain_reports(struct admac_data *ad, int channo)
-- 
2.33.0

