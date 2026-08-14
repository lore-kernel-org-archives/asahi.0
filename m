Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36913382F4
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786704643; cv=none; b=KAZRvor0Dx2VPK20GxWXnNeA5P441N0zjq9oHsY524nKAEpB8a1P1suij1HQ7mNn5FmnVvljPwEWCLWZN/LxAUyCKQ4E/OOR5+IAt31RBHu4i7RpmQqI3k1T/XpCVgADUQ4TwlgdWwTPiyAy9kuwnNhqCJCo4GMlEwXo91n0mOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786704643; c=relaxed/simple;
	bh=R3susIZZw5oxbbX2d3wQqb07AMqCARoAx09SBnwVqRc=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Gu/VXVCjfM4Ptd877mI4rWpV63nd6clb1n71f+t+UIQDNr2xzgeadl35sAAD3Pk44Tj3cc2I3Pg0OVR0NddaSvCgJHYhjS0ThdAq5TY/DDEtTVSoe9Y1Mte8LktFxwHYFi/DxbOoK2dL3IftYVHbMY0ht6tbV8w24PkJXYEMWQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=J/cmatla; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="J/cmatla"
Received: by chaosmail.tech (Postfix) id BDFDB1CBF47;
	Fri, 14 Aug 2026 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786704626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fk38717sRf84XA5nxcFuMZclfSN0BjsWFn3l9+IPIps=;
	b=J/cmatlaL96OZq6oL/hOX49S3xwsUqOYZBrGcwau9Ovvlqw9+/OBW5EkScIL6EscA2u0pN
	tGYPwEVJg/VDJcWz2CNxzoweveWb4KwPmgE485k7KlhudINXmJ8+3qBrO07JeL3G0Rsye5
	BnttChsmbWGE+e8F3bn8e8js0Xmuy3c=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <an7lj2g1bAkOZw-o@black.igk.intel.com>
Date: Fri, 14 Aug 2026 12:50:15 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
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
Message-Id: <CA6513E7-9CAD-4EA1-AFE9-092A0D7C905C@chaosmail.tech>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
 <an7lj2g1bAkOZw-o@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Aug 14, 2026, at 11:53, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>=20
> How about:
>=20
>        int tipd_init(struct tps6598x *tps, enum tipd_hw_variant =
variant);

I am not sure what this gets us. The tipd_data is already needed before
calling tipd_init, as it contains tps_struct_size.


