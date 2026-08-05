Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2811B449ED6
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931055; cv=none; b=CwCOaFlU0zRko9JuIiHTZH4vKHt6mkuH7Mlc5abvIuZzuba32Hai4oOxFtBO48VmskzJQkw4A2WhPiX6Pa1MFqEWKNAMYzbSWfsjG3ql1mNC28lSEthAunf+lHiIZuNHFwcUuqqTpbjk1ZesF58ojxjJYY99uVAKaAmNpv1XODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931055; c=relaxed/simple;
	bh=fhVJOI/iWMfAidx5QvrgBKyOQQvEhaR/KBcGi/ST9nI=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=niJ61cHOCYSv4B2tgAvHNFoG/sZLg3RxaptE9zOF48t2/tbYvq/dRjQ2lgn/1rzETfid6k8nFlqGEI13YVlxgGrKVDxVmPvnAwVZ+Z/15vUO2XFmrkpxn8WOJjsccthZFBQgbmp5cxUAAQ3E64Lo7p7JboGueURZmIN4PkkbaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=m9M3sVw1; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="m9M3sVw1"
Received: by chaosmail.tech (Postfix) id 6801F1C867A;
	Wed, 05 Aug 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785931050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhVJOI/iWMfAidx5QvrgBKyOQQvEhaR/KBcGi/ST9nI=;
	b=m9M3sVw1v0K3H7rD9qC4lQMMiOkiLN1VJEUvTTA06lHKB1t9gAxf9S4Lrpf5NkXDruibn6
	zJB8GkxwbvCX9e2iQt0EgwvZnl6LwrGtDDd05mY+4wsyoja0w2+pc5TJydTN3QzEEdzF7W
	4aTavklZlZT+MK5DIkKzTF9p8ma3gvc=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <anMi2q5FmsvE4z8W@black.igk.intel.com>
Date: Wed, 5 Aug 2026 13:57:18 +0200
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
Message-Id: <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
 <anMi2q5FmsvE4z8W@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Aug 5, 2026, at 13:47, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>>=20
>> -static const struct regmap_config tps6598x_regmap_config =3D {
>> +const struct regmap_config tps6598x_regmap_config =3D {
>> .reg_bits =3D 8,
>> .val_bits =3D 8,
>> .max_register =3D 0x7F,
>> };
>> +EXPORT_SYMBOL_GPL(tps6598x_regmap_config);
>=20
> Don't export that. Just move it to i2c.c

I use this one in spmi.c too, the regmap configuration is the same,
just the backend is different



