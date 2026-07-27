Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5585C3FCB0C
	for <asahi@lists.linux.dev>; Mon, 27 Jul 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157557; cv=none; b=dY6L2dspYrTOe91aAG1ODixHGKtBIdJHnERpfZXUyMShBXuD0qu69D0BsCdePstqk7c1FTBxdTSE74L4xqH0EX/zSMsz2Ic92kn0nKWtFpaANV/w5D/uu2o8dm1Upwj1iaCmZlCYMkFU4NgspLamX8M4/53z9aXb/rEgJIsNKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157557; c=relaxed/simple;
	bh=r7lsKKTnpoE5fxwbu5ZemxHb0/HMVfK5LkXqnfA2Aec=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hVHOcnx7Lrcpm8h7Qb/Oc/4/MScGSAKUZu7HWbGCZepjbeOlIWCjZDwZ0ELdJ90eGrtBsG5LdtJroq95Lb+GDvNPt5QM9I3dLB3OKfIfUIn8NsnAgNJIUOgUAGNnRpOYvYLjNevYzEWdwlXjjukSV1DB6/+IusQrdlxU+BczrwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=pHpmR5nH; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="pHpmR5nH"
Received: by chaosmail.tech (Postfix) id B143B1C9733;
	Mon, 27 Jul 2026 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785157547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CRjLtzZlQPexomBbHw5/yUmpMluSz1BR7RnnnOQPNw=;
	b=pHpmR5nH6TZ1kYs7zQkAoSXNb72SC3jEOTFMvYJ1u3qq7piGC8M4qWsbFM1msqQKlIaCc7
	GODdhSW6AL6/hfh0YfTBMpCj5mmcg+7V7ZIBcrgltI+Z7EnPkBmxfibJUi7pdb+dw29tG2
	MX2FVufJSG8Q0r0lq38IO8pH00GNAaI=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <amdVkYEiv_tOZuwG@black.igk.intel.com>
Date: Mon, 27 Jul 2026 15:05:35 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alyssa Milburn <amilburn@zall.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
 <amdVkYEiv_tOZuwG@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Jul 27, 2026, at 14:56, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>=20
> Hi,
>=20
> On Sat, Jul 25, 2026 at 06:20:57PM +0200, Sasha Finkelstein wrote:
>> From: Alyssa Milburn <amilburn@zall.org>
>>=20
>> Make the core driver more bus-agnostic to prepare for SPMI variants =
of
>> the tipd chip
>>=20
>> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
>> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
>> ---
>> drivers/usb/typec/tipd/Makefile           |   2 +-
>> drivers/usb/typec/tipd/{core.c =3D> core.h} | 109 =
++++++++++++++++++++++++++++----------------------------------------------=
-----------------------------------
>=20
> That has to be a mistake, right? You don't move code into a header
> like that.

Yes, it was a bad idea, already fixed in a v2 that will be sent in the
near future.

>> +static struct tps6598x *tps6598x_from_device(struct device *dev)
>> +{
>> + struct i2c_client *client =3D i2c_verify_client(dev);
>> + struct tps6598x *tps =3D i2c_get_clientdata(client);
>> + return tps;
>> +}
>=20
> You should not need anything like that.

This should make more sense together with the following patch, as it
can get the tps6598x from either the i2c or spmi backend.

>> --- /dev/null
>> +++ b/drivers/usb/typec/tipd/i2c.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for TI TPS6598x USB Power Delivery controller family
>> + *
>> + * Copyright (C) 2017, Intel Corporation
>> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> + */
>=20
> This driver is not coming from me.

I kept the attribution as both core and i2c are your driver, but split
into two. Should I have done something else?

>=20
> Thanks,
>=20
> --=20
> heikki


