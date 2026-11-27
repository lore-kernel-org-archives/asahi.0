Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788142;
	b=fIqz4/V8K+k2et+D4x6JjkW4gsbUdrm0bQ0QjHmoORm2yRHizBczNTtR5ZE9E+WuUv4p
	 7l1BOfP2vCLztGX2qVy/icmBobbJOC5hr6e0wlfEirg28hltaOfHHX+rqBDjehHli25sJ
	 6B6SX1QhGSPkwj1NYx/pvfHU2/xE5gPGEHXwKiqeCqBBHkDM2o9gAXmxLv/6ESwDgcoAC
	 rH+lu0paIhJb5j5G97fJ4nwodz1nXaM4XJJs47FaXheJ424PRafzsRa08IlGe35vD3EBe
	 6dZlnICKhZASpFWGO6qycpAs+llRf3p2tyquHCdPXRkiZcHBq4VZqJ2jc/BOEoZgcfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788142;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NJoIl4xSoNTiGvL1eSe44490aIZ7i1aHsEMzBMNT6I0=;
	b=eEr4C6YCYsIK/zooEhN3NSoUd9bRjOt6Hj/L/zT7IYllDNTRBq6lhy3qycXi0sz7jumB
	 LGBkdOSwtqy3AH/HVjeyCg9FAGjvFQtZTKZb5Dc1Y2ur+HQpRpvy7jPBp8U5scjPPEAVM
	 g9lrO0z9fBzA4t91tyZTASDJ0LBGUIhkZXwEv2CgDqTcI5tUnpJro+4MbuLxmHtZ/IJw3
	 gmV/ImHQTa72u08ayKZUd35GGnc0NXzlmTPjlcnooKzcxU4wQSKyBcwi5VsYA4h4UmU04
	 cjLQR2ZO4P2subdrenlXdi2Q+MnTUAe1D4Hs+oG0Z1TvGG2nhZytHhabACyXta6jcng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=sNhoetdQ;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4109606A326;
	Fri, 27 Nov 2026 14:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4109606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=sNhoetdQ
Date: Fri, 27 Nov 2026 15:02:08 +0100
X-Lima-ML-UUID: a7fd1b90-4737-48d6-a7a4-a2a1d7a0f195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795788133;
	bh=NJoIl4xSoNTiGvL1eSe44490aIZ7i1aHsEMzBMNT6I0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sNhoetdQbdPAZI2AoAuOt8OXJX7HB+jrM23m9xHvOLiUhXzFdDIJfQWraGeIIJfhQ
	 gaWe5DBhJzoAZeVtXSSqJoXiI5kIDwP1ABHeNCVpYoAg4o6DRG9Z6DyK0aJRWzV/Mi
	 bwftL7pCUOTmAXnFHQmDzEKgf1EyiTLFoeePYjgORQgz7yV7+NWxhY1CiJpZotFrw3
	 UnFl0wug+ymyE384bmrw9yMhMKjF2ZKZQ7fwNW58cAtDFYkI+/0J6J2eu3++NrGn3/
	 BncY58cOlkAli9hLTCDTMN2WgLfz3dFr9S/MReuHDmkAqo2k1bUEE5C9CXtXm6u/KN
	 GHzgIsw6ZmTnw==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 michael.reeves077@gmail.com, marcan@marcan.st, j@jannau.net,
 asahi@lists.linux.dev, sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 2/5] wifi: brcmfmac: pcie: skip the host ready
 doorbell at init once it is a capability
Message-ID: <20261127150208.77dae9de@kait2en-mbp15-1>
In-Reply-To: <20261126142942.881504-3-arend.vanspriel@broadcom.com>
References: <20261111120748.23795-3-dev@deq.rocks>
	<20261126142942.881504-3-arend.vanspriel@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 15:29:40 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:


> The sentence "The BCM4377 stays silent without the capability, so it
> stays." is unclear. What stays, the capability or the doorbell? Also
> please add a Fixes: tag for a83a99d063a0 ("wifi: brcmfmac: Negotiate
> PCIe mailbox transport with firmware"), which introduced the host
> ready capability.

Hi Arend,

Well, sometimes my focus is a bit off since crossing the half-century
mark... I meant the capability. Without host ready in the host
capabilities the BCM4377 does not answer, so the capability has to
stay. I will reword it and add the Fixes tag in v3.

> The B2 only halting on some loads also suggests
> the doorbell is rung too early rather than that it must not be rung.

I measured on the BCM4364B3. With host capabilities 0x7 and 0x1007 it
loads every time. With 0x407 and the doorbell at init it halts every
time, with 0x407 and no doorbell at init it loads. The value written to
the doorbell makes no difference. I will limit to the 4364B3 then. The
BCM4377 runs with the capability and doorbell at init.

Andre

