Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C511E7460
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 16:16:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id AEF2432005C1;
	Wed,  2 Nov 2022 12:16:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 02 Nov 2022 12:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667405763; x=1667492163; bh=vjsW9AucU8
	8T88HijQ2DrXg0E5k9G26I+ZgoZYsnzAI=; b=p7Be0evCxVzL9WsdOQE4XYZ+IN
	fE/97l2ihtQ1rXMk4iqSOBAq8BsukeckaHXigDSbz1F+xQ4OJ7M7BzRNJHOz4i1f
	Rg5pUXmQ0h+luQXk5iDZuwHt9OJkSE9tEEWf8pktnQ0oDTjsd219fJWQtwXOmfly
	VxUXn8GoEVjahMbW5xheoI8mKp8uSLr5SSDmmNFvjmN1OCvTUM6hqEoo8XG7V4AU
	TpkzIq4kRYvw641pcjFf/LFT94vpOcFPuex2rXseTYaP5FxcsjaVTxPDpf2EUffI
	CFzEEW4VnitwTwsDbn3ELwGo/n2CHSe+NgOJ3xfuHKQRk97ry3vzx+vAPUvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1667405763; x=1667492163; bh=vjsW9AucU88T88HijQ2DrXg0E5k9G26I+Zg
	oZYsnzAI=; b=tJYHxDZW6rW4pPnCLpsIta4NrRsfO1HsHdhpmYM7x39dx1b9V34
	ube4P7qlGDjt3p3xx0FlTOamj8PoQ7GzpWEMiBe+Yy3Xdbb5Omb8mKZ20+3sjz8y
	XTHTFX9/wdwsTJn7jZHTd94PCGyvidlwa/YwVJQBItyFfqVNU6tqHHh8jL9YhLGa
	/hoAsCKKsEGhlyV1uO5nmLQGlph7I0/Co9d24rHaWSqhWa7G5Lx7964B24s8vdXO
	iw2V2n/fSt3ZQwafBaxq3hmAUZShG7tC68SlSeNWovBusHZutNAQvWNt3eTbYBG3
	Rg6LscQAoyVvh2HO86Q/7q8Dm5mbOqDInVw==
X-ME-Sender: <xms:wpdiY6HvLI4jQjbUwyrqCQc-xXX3gU4cKUZoWMsX1IaWtIXghsPIWQ>
    <xme:wpdiY7XJzrb7SjRTev8FnzZPqH6JOoPyJHHvP-BETWm2FR6O0OKQvmvpCfb5hSA4k
    LGDfII561qe29I0WFw>
X-ME-Received: <xmr:wpdiY0LYgH9ZUU3TrefF0JiHfLxE90cLtdTq5wBRzM1tizIrKx9XO2a_3_uuMKqyhc9qNvDv0n5n9lmopl9A5h5cazK9bmL9oH3BHVqmMJ0PzyulkOD1QOnYn1Afig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epleduffeiheeuvedtffevtdeuleeljeduudfgtedtvefhfeffvdfghfejhefgleelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
    hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:wpdiY0HM4ukHeVnwrAjU32g6S62a2t6rCnh4FpmkzLZoTPYESoni5w>
    <xmx:wpdiYwUiQz-oHg0vNUOEo5d0lxHmtjS0y5JM9AcJTzht7tpAAviybw>
    <xmx:wpdiY3OWqHNP_2qA_ksAARSYCiVVL6rrDMZ2Ed13NCsbr9pJlQXSdw>
    <xmx:w5diYyJ_qRPDhwydtkyvKeyfzAPFiDu3ixePL4pwB8_Cxv18jT3YRg>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 12:16:01 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH] usb: typec: tipd: Prevent uninitialized event{1,2} in IRQ handler
Date: Wed,  2 Nov 2022 17:15:42 +0100
Message-Id: <20221102161542.30669-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If reading TPS_REG_INT_EVENT1/2 fails in the interrupt handler event1
and event2 may be uninitialized when they are used to determine
IRQ_HANDLED vs. IRQ_NONE in the error path.

Fixes: c7260e29dd20 ("usb: typec: tipd: Add short-circuit for no irqs")
Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/usb/typec/tipd/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index b637e8b378b3..2a77bab948f5 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -474,7 +474,7 @@ static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
 static irqreturn_t cd321x_interrupt(int irq, void *data)
 {
 	struct tps6598x *tps = data;
-	u64 event;
+	u64 event = 0;
 	u32 status;
 	int ret;
 
@@ -519,8 +519,8 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 static irqreturn_t tps6598x_interrupt(int irq, void *data)
 {
 	struct tps6598x *tps = data;
-	u64 event1;
-	u64 event2;
+	u64 event1 = 0;
+	u64 event2 = 0;
 	u32 status;
 	int ret;
 
-- 
2.25.1

