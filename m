Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060469;
	b=vDBBqBA1jN262BnKj6sBBFMzJQIBS0X3bFK65psS0LeG6o9gy+pqgIa8bBBI+GRAMT1B
	 VxOA/+Yi63GwON0UJyg+nLGy5TuR+zGEMxRYJ1OraBupw3mYrew7s0RML38WvXteZLXLh
	 ulKelH4O0K2L9QXrWREPeMq/bxklEJXFqltAkdVSbDDRkRC6MOqqybqKYzLB2pn4pzrgp
	 /uTgz/A0k2tFccoZZzuOd0XvoICu0cIINatHo7kWqyiCQmzeAEt1neFzb9R4bOpHB0l/f
	 /nXjCRN8iX51Wm7u5dh6rRLB/s17ytrD8o6eDR6MQSevWzuwJj/ByNRoa3Mgf7Ke1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060469;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nKkg05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=;
	b=p8NUVL4r0V64nVpCdbk5rxk8WMaZgH6IY3VVYOgwnFxF4yrRzCC2e9ENA0RV0tHsscdz
	 easSfvz8Qg2LgQegqMG2pXBGXIvokG0gQVNF3WuJlzhdwTCFKp32OuyQIug6jdJ0b319l
	 PvYXLFLksVyY/2xW9d8IBgSuWrYvauRv25+Gr1HHUBHw1wMj00BR4IJ4o4Hua6bX1MiM7
	 jrbw4YRmGmyE8IBsspL1F7VgTnzMFVs49y2ihDefLTo2bZkJ08R8WUTy0JO+kI8EsA7Cb
	 01pNlW+O1f3M41OA8ivHCQWigrBG1FOfVWVH410vrCwaaju9I7Gd3AXoZTzvucNbldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=az57Bq87;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7865606A326
	for <asahi@lists.linux.dev>; Sat,  7 Nov 2026 14:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7865606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=az57Bq87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=nKkg
	05I99+uQhW9KEZpbGaMFfkVpBZ+oFRIsqMlTLGk=; b=az57Bq87c2CQgHhK/9n5
	8/YVmXgISKAdBBrBNKjBpPQGOPT6Dq8P7LYTUZ9IMpuqEStP4aR0ELTWFlvS2ovl
	9F2mtwlyWKl8t38l8cuz/lz6p+sL4MQAlnSX2A8B8oizEgeDtxerWNXWrW77QH2f
	5odvcHiCLmLHsrpFlqBj4X2Npf8pvw1wyB5AdzkqRipb6LonO2OM6LjETNeu1Me+
	J8ZBZlPZAmXo8QQHpKs8wFWEIPfY3fl8XUbheRPbGo+8cgoYeYtINzJIG0xYLf5M
	XzHmaMa3Z2FsRFWxyefVWO6kfIr7k9M93QYmS1tDHcKaUFLkcMdp30XkDCX7Phm5
	Xg==
Received: (qmail 2526305 invoked from network); 7 Nov 2026 15:07:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2026 15:07:44 +0100
X-UD-Smtp-Session: l3s3148p1@4+FpQLBfktwFFu4j
Date: Sat, 7 Nov 2026 16:07:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/9] dt-bindings: i2c: apple,i2c: Add t8142 compatible
Message-ID: <au8wq8Bqr4tZ8bj8@shikoro>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-7-cee55de54b2f@cyberchaos.dev>

On Fri, Nov 06, 2026 at 10:24:56PM +0100, Yureka Lilian wrote:
> The i2c block on the Apple Silicon T8142 (M5) SoC is compatible with
> t8103. Add "apple,t8142-i2c" as SoC specific compatible under
> "apple,t8103-i2c".
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Same comment/question, as for T8140. Better via apple tree, or?

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

