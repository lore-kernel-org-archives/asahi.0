Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD42F8EA3;
	Wed, 12 Aug 2026 02:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786503217; cv=none; b=WgZApDPxCt+iJ8wa/IfteOhlyObJmsEs5WyON+CFkNmhDDI1br/v7wsFP1LOC5+0wV0qw6fV+oQxyV6ah88SGHhH2K8/d37IRS8iXyZa56eejvtwKZ54kfMBwzMoYCtQK++BKmB2K/Se+a8j7pyNmRSwJG2dEjTGp2wr5dTumho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786503217; c=relaxed/simple;
	bh=ul/W7SUnnOh/x4cBwkMVJdMPSaV5vqqCDy3f6S/2/yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuiR/45FAscTTJNTHIqvQz87508a/D4gJrRq2K350N/5tkt4gDMEQhbX79t/+mDyKYQPaYx24J99F8cVjsAaJ2E0cfOLiFmFwSP5ljsMazmTBKSjYxSfgEjCWFdqAI+IY+jdUY7kTvxJlhMORdU3wVNOLru1wgcsLnyX6IMC9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNcjboZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNcjboZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31401F000E9;
	Wed, 12 Aug 2026 02:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503216;
	bh=f4J/lV9oDu5O+QjCGiWx3R7MU92RzGWD6b7CY//ngrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNcjboZt2Z7UlufpgYTK8tRHm0AYNs1JTTLra/Hay3yBXn+Zuvl7zyfWDVFdtw5Mp
	 AvKEKokWYOqiOYzROmiX5HeY7e5yW9j0wBGPHs76uXYLZADESaPwOgfA0nkBZFCiye
	 ZXdKzkM0JlDItX7JCrAgmjo19su9Zbh631MJk91MxFHlRHU3ixuc2oesWRCHRteRuz
	 1jn87szYOoVyi2l8BNFD1VfMscvtFJUjINPzhqqqArwcW6Y+ny2RqATJZ37+qnS09x
	 ZwFGdAFguOiOOM4OA/aA7qN/cf4Ha/JWy4hLM7vErNkzWHlq+EOi3mIH+UBJ8mXVjN
	 zgEUCXnzwCYRA==
Date: Tue, 11 Aug 2026 21:53:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
Message-ID: <178650321482.626908.7700828369794152716.robh@kernel.org>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-1-79855b150914@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-tipd-ace3-v4-1-79855b150914@chaosmail.tech>


On Thu, 06 Aug 2026 11:37:20 +0200, Sasha Finkelstein wrote:
> A variant of tps6598x that is attached to a SPMI bus and is found on
> Apple devices starting from the M3 series
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                                |  1 +
>  2 files changed, 79 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

