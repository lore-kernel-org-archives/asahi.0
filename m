Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A3256E
	for <asahi@lists.linux.dev>; Thu,  2 Jun 2022 17:32:04 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 6460B32007E8;
	Thu,  2 Jun 2022 13:32:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 02 Jun 2022 13:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654191122; x=1654277522; bh=iVhHyOHs9s
	Ft+Gea6I99/NLj9KXC5Ni7NVI+rjhpYr4=; b=ku41WfcJm/1q57au9hfnw1Snjr
	o2zc2CKSeI8zcCv+MNqROOIebvilz8M6X+PZw3fGHYoA4+KSd+NmE7kEMv7hEF/i
	YQ7pUE7L7LPyesxe5QrYdP08zI17KW5B9tzYZ5tGcYfBzHJdhJBblvN+SF+MLpuG
	SwdBMutDMQ3PN5BtdpR2s8pP5oWYa3I++p4dfAfGWd8wIcduel7qTB3aBesr0K1Z
	ZH0dQkrK8jEJsJJOaWAaP4VXWe8qksnvW2FlhU6RFBw7jV4G4i4fUwgUt5PbI6P2
	ExXr+sjXx7QyW6JzqoJllfYCiMlmP54XXVDy891RwaeW7SGPTUrtyGsgPJVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1654191122; x=1654277522; bh=iVhHyOHs9sFt+Gea6I99/NLj9KXC5Ni7NVI
	+rjhpYr4=; b=Q4tu7g4xCx7TgEV9zy+lfHMQGbqy/uBvNqv7xlA/Y6w8Ui2Ruul
	m4F3A+aupb7xDXcgPSmH5s9Cq3L1vA+qGvRA1kCgUrQMbPX4f4H5byEMZuNtkbu8
	Juq2Djk7cPv1zW32gQ6Buhu6bUjewT7nYuvTFU6Qzcp3vVEy3iXZAj9zG8htyspS
	yTd9dfPcgWJ7J+BYC5y/Nj+yGLQotlasYD6b0lXbTpP7WAxEgYQRf7Wj+fo95zeu
	/KCBp7F+5iv+kvqZ1d0tALP2R2nGT+qZImwR8EwspKR7FM2z2iHaVduxBN9z7qy/
	+GcZmtLWjj1XEXnjR6Gtn1bCjRfIal0oSDg==
X-ME-Sender: <xms:EvSYYkupaShFF-Wl7nEVb8VhhENtvZUWHSH19irPt5nwK9hc7YThsg>
    <xme:EvSYYheTMIaG_jTHYGZ_P08Mn2IwFFTrZPPWz5ybsWbvEjZ7sxsX5_pqUxnhJVy07
    7_bgLisPt6Zp60wwPM>
X-ME-Received: <xmr:EvSYYvyiaUnY52jRB3M9W9twkQ2B2z4UTjNva2g1N-HwJLH0uJJgiAlvtK6f8GLdhbTu1veZZKLBHVl4C2pPh60LZJ8Q5dTW89ZvaT6WrOzHfibXxbrOECgs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleefgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epleelffdtleffgfeigeeuteevjedtjeelgfeiueegledthfdvjeevteehhfetheehnecu
    ffhomhgrihhnpegrshgrhhhilhhinhhugidrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggv
    vh
X-ME-Proxy: <xmx:EvSYYnM5nDexswN_7K5QmjabxvXArotk2UzyLnAV_AFNEWB75-Vhew>
    <xmx:EvSYYk-MafXAfpYm7nijXVHsfQxSuZ2h-FQDhvQ9aSLpapX3-H7mPA>
    <xmx:EvSYYvVTuq3Foe-xecjZm5YiJyLD6Fd2W7ujJZBHqME_SowruMrvuA>
    <xmx:EvSYYoZhx4CnsyoQaBxVHLiFBmGjK0uxNdC6VZKA4DgAEmsoUUnWfA>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 13:32:01 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add ARM/APPLE MACHINE mailing list
Date: Thu,  2 Jun 2022 19:31:44 +0200
Message-Id: <20220602173144.2263-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55114e73de26..621eeb037a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1826,6 +1826,7 @@ ARM/APPLE MACHINE SUPPORT
 M:	Hector Martin <marcan@marcan.st>
 M:	Sven Peter <sven@svenpeter.dev>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
+L:	asahi@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://asahilinux.org
-- 
2.25.1

