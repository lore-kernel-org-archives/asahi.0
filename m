Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B423398A
	for <asahi@lists.linux.dev>; Sat, 19 Apr 2025 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745044978; cv=none; b=tfynvlCv55jsT3VFASaiKWuOm6GNeanByMBeaxWGMYiSRNrxe86XrglwBEDUpVTwIgW6tpWEvzdf6GUkbCW7ePDLStaB+RHdWIWY1HLkiGTfUXPlMh3WkXy6FTncVnH5bOl7tuBQY1tYYE/3Eo9zpmbmO8C9IrPtEAFuqSK/keU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745044978; c=relaxed/simple;
	bh=VqGVhfCUIoTEZjwZ5g2Aw3T3o84w2yT56HybYT6FXoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXxnEYLPUdym7dJ3S3gGdb51O/25UJsDR61Ub5A4x/6OduP4RMttJ/3WkKBF/dM5NFLjwHg8z1Tgt9VBjUlVxINNxD+bAvF2hOYHhJBXPRnBFsjOuFuXpzpwoCNV2zJ9yiJtG5aYGeg1szlByFddaDwWkXzBOzASGISg05tQq+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=ZajGiZ3H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PgnRlRPZ; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="ZajGiZ3H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PgnRlRPZ"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 565CA2540394;
	Sat, 19 Apr 2025 02:42:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 19 Apr 2025 02:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1745044975; x=1745131375; bh=TPeKX3dzurPXcStYN6YQqupzWVpUpBx8
	KcP59VHXwmg=; b=ZajGiZ3Ha/NfS3bbkIZQPAtT+i9q67+x9t1ea84T+UvNl8el
	jfIP81exuWi4cX7w4NaPfcT1Qq1lLe/yDcNdCmd99zlXBqLh8oqvhTtbhZTpvSYt
	HamgbNl82OzSdLQbvDdEN2iV1kRR2FUv07jfE8MsjXa4TkBJ37PjdQcsuU8gGGWl
	Woz08sR30k8H5pwXNTWCwFxMMxaCYAwtFe73UcG2F+CQoldIUPNqR23ygkWjZytH
	11dQbCt75hLbkPXwUCB4oqctkWOyuSqKVqD6QxyMBFfzDTP1s4cZOzLxMaVsknvu
	b+jnOEuoO/JSnN3L5Mi/LpVajizgeVHsZJpnQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745044975; x=
	1745131375; bh=TPeKX3dzurPXcStYN6YQqupzWVpUpBx8KcP59VHXwmg=; b=P
	gnRlRPZ+fMdRp6w7Gu8gRldQaFU+Y69Un/uzp+o2igzWKtZK3nU4kSOI/ZkpNFai
	teMqRaVHr82LIbgq+krvMtDBYVqRB1HwNAfVNmPK/Cmuo++BFaDulJ8nS89A2A/b
	lD95UOX59fqdkE6R97w89JVJI9iRu3k2Ima/+Er4WfpgSPLFSDGja2g4sWKae03e
	E30P02XwgH/9JkSzk2zAZKG/f9xSFNh7h3GE2Bdhd/d9teH3azDdFg8XuH0nwHe9
	lis0QwnIVIi3QvmRi6njxJptXhsNWRKsu7Lif2pItkfipwE8bFeKuu/F3Nwdhluh
	4o5ngqs2cDdezl9U4g71A==
X-ME-Sender: <xms:7kUDaNv9KqzY0xWRjjvAm5AIU0jlvT9mm97e1U18-PavqTXZylEO7Q>
    <xme:7kUDaGf0Oibv8yX6OoYZXJ_TNfynsCKGvmGx6va_2N9rfgJYtwH3JrEOblfOHq8xd
    UBANXmJ9SK2pJlsk_4>
X-ME-Received: <xmr:7kUDaAzyAtcC2zyH0scd1P-aHrHI-EkhBWJ5yIrfIuH3NkHoG87g5LCPv9wogWCEqA2d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeegfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhinhgr
    odhkvghrnhgvlhesrghsrghhihhlihhnrgdrnhgvthdprhgtphhtthhopehsvhgvnhessh
    hvvghnphgvthgvrhdruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigv
    ihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhope
    grshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:7kUDaENDqwEwY45ZRdWiZubCRP8rtPNqe7ryEl2CYsqNzmaFPHfwUA>
    <xmx:7kUDaN-ZYezBpGmh288YywPWeQ9DUdXnYasyeVH_ZIwZXuFgsVapOQ>
    <xmx:7kUDaEV6RxIg8FHum9dbYR49SxETqa471CzxcR2tOKv43oWtgv8dSQ>
    <xmx:7kUDaOeeggCGsiIdWFsIaBtPmYsfhArUQrhujeqEsXaaN6ry_aAS4g>
    <xmx:70UDaMZ_uLiXcF1MLyUCYRSJjIpB2iNmO_eRVTXFTfIMGnb0ghh6DsYr>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Apr 2025 02:42:53 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>,
	Asahi Lina <lina+kernel@asahilina.net>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	"open list:ARM/APPLE MACHINE SUPPORT" <asahi@lists.linux.dev>
Subject: Re: [PATCH] mailmap: Update email for Asahi Lina
Date: Sat, 19 Apr 2025 08:42:49 +0200
Message-Id: <174504490657.63781.5255065880320979916.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250409-mailmap-lina-email-v1-1-265d05848ae3@asahilina.net>
References: <20250409-mailmap-lina-email-v1-1-265d05848ae3@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 09 Apr 2025 18:11:21 +0900, Asahi Lina wrote:
> Add an alias so I can more easily filter kernel-related emails.
> 
> 

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/fixes), thanks!

[1/1] mailmap: Update email for Asahi Lina
      https://github.com/AsahiLinux/linux/commit/712dc3e7b979

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>

