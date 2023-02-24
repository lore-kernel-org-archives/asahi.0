Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43638610D
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 15:29:18 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252145; bh=StaFikSjZpFQ+BUcIlQfwrxM+sCnU+rvBEoVvGQ2nmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fOvbi5u7TfZbdRb/5lxtFwcD+ebCgEW+egwfuLYdhfzxpB2grc3CsYFX5m3JosTZ3
	 5CP7I59IxQyKuSrYvD7i+g0nm3Z7Anzbz6LcVbPDatTuX7bCwQrAa765yoNtapNLkx
	 VYNi76Ina7OQb60oYtDZ5wzW7ec+E3dPHKVJiV+4=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: apple-admac: Fix 'current_tx' not getting freed
Date: Fri, 24 Feb 2023 16:22:21 +0100
Message-Id: <20230224152222.26732-2-povik+lin@cutebit.org>
In-Reply-To: <20230224152222.26732-1-povik+lin@cutebit.org>
References: <20230224152222.26732-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In terminate_all we should queue up all submitted descriptors to be
freed. We do that for the content of the 'issued' and 'submitted' lists,
but the 'current_tx' descriptor falls through the cracks as it's
removed from the 'issued' list once it gets assigned to be the current
descriptor. Explicitly queue up freeing of the 'current_tx' descriptor
to address a memory leak that is otherwise present.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/dma/apple-admac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 00cbfafe0ed9..497bb65b7d6d 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -512,7 +512,10 @@ static int admac_terminate_all(struct dma_chan *chan)
 	admac_stop_chan(adchan);
 	admac_reset_rings(adchan);
 
-	adchan->current_tx = NULL;
+	if (adchan->current_tx) {
+		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
+		adchan->current_tx = NULL;
+	}
 	/*
 	 * Descriptors can only be freed after the tasklet
 	 * has been killed (in admac_synchronize).
-- 
2.33.0

