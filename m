Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CE438F620
	for <asahi@lists.linux.dev>; Sun,  2 Aug 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676303; cv=none; b=qNjaklYT9nLdcaZjSJKwkQnaGjv1ge2U4QVu5Hdw+dImPkn9mOYh0hRh+ctatke8nxcX3C4qkAsvKzi1uw/NND2Q/MffNLhakak/ZDC/W430z/i7Rl1zIa3sndo0wFAqc9YMQg2ZPS4nhI1BC2C8vCXWl6I/T34oXzUvEqIZe80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676303; c=relaxed/simple;
	bh=YNKsRIoBSvbyoHC2Wv93S5K/92MSkCp6ho2diuSS9Ds=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mzeP6TXdzb1Kv4eJ7dsDPPAN/ukcQEOExaDgtm2KqsJPfVtRBZiKYZmT/X5W4dJZxlQ+vkCoS5xWTDF2x7P0+PFbyNWVBLICqLv1P0LX34ksNV9ny5o3Ck67i2MBZiX3hUenuFt3kIvBbGUeI2fcktZmt1Ie1g5/WyqQeQRIT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=b/nw4Pnc; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="b/nw4Pnc"
Received: by chaosmail.tech (Postfix) id BFF551C8156;
	Sun, 02 Aug 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785676298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkTOnR31yeeOdOJVUVg0K2ZzHo20RD5KRKrlXpN0Gi4=;
	b=b/nw4PncVc3c9HkgKU0eBuDmAJAIGrsssZDqA17JgonoWUAQPIF7JZZDoHqlB6Xjib635S
	ytLA+lr115234uATxcGpo6Bh7Ga80FS+Is8yoEMU4U7CA2BFQg6xDc8J/H6pPR66eAsLxw
	Ju3iiYydf06uNaULPdpLvLY/Gjr+hS8=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 7/7] spmi: apple: interrupt controller functionality
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260802130738.GI806854@robin.jannau.net>
Date: Sun, 2 Aug 2026 15:11:27 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
Content-Transfer-Encoding: quoted-printable
Message-Id: <31025FFA-DCA6-4F73-8F86-A8FC3CA91262@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-7-f43e5f10e583@chaosmail.tech>
 <20260802130738.GI806854@robin.jannau.net>
To: Janne Grunau <j@jannau.net>

On Aug 2, 2026, at 15:07, Janne Grunau <j@jannau.net> wrote:
[...]
>>=20
>> val =3D readl(spmi->regs + SPMI_IRQ_ACK_BASE + SPMI_IRQ_USER_SIZE);
>> if (val & BIT(SPMI_IRQ_FIFO_RX)) {
>> @@ -239,6 +357,23 @@ static irqreturn_t apple_spmi_irq_handler(int =
irq, void *dev_id)
>> handled =3D true;
>> }
>>=20
>> + for (offset =3D 0; offset < SPMI_IRQ_USER_SIZE; offset +=3D =
sizeof(val)) {
>> + val =3D readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
>> + /**
>> +  * because of other masters in the bus, we're going to get a =
multitude of
>> +  * interrupts we're not interested in. irq_resolve_mapping isn't =
very
>> +  * optimized for the nonexistent path, so instead we mask with (a =
locally
>> +  * cached version of) the IRQ mask
>> +  */
>=20
> I don't understand the comment. Interrupt bits in SPMI_IRQ_ACK_BASE..
> are set although the SPMI controller has masked them?

Yes, they just do not cause an interrupt to be raised.


