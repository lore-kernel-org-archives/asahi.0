Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A531354D;
	Fri, 30 Jan 2026 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769760224; cv=none; b=LKeXWsxFu6XeV03kTyEGk6E9zDtNo3Kw09iZH+yFSqdQ6XZtYektmRiq8gry9fP1WvghN7Mq5SN3bw7ilMgdznaF84Hi8tzsTC3XDqAYkhI/jWNgfpf+eVKGguFr7M+gKb0Qumtv7fJDJQngCb0zAkWa36Dn0+kWx4SOPDDZzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769760224; c=relaxed/simple;
	bh=euq3DIZBTE4qM2eqOaDtKndvOwdKebOXy4NoVSox5u0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I3miAWPKnniLTA6dSVVSzmR5UXmso0FbkTVH0w3WrRTGy9SwbKh9KsFgQFh9riCVzBsnbyX+ThJpzTBTVUlLp07t7I9ZXhNzyu1po23aW3OndkUOJcl103VhEmSKwKnqiVIyEA6UOO2obPH3VXLbFcCSLokZsmC+vHn/JxAtVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL8/6tXG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL8/6tXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0C9C4CEF7;
	Fri, 30 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769760224;
	bh=euq3DIZBTE4qM2eqOaDtKndvOwdKebOXy4NoVSox5u0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aL8/6tXGmAYMFT4YxVmeA6am6EToZctkR2rUa7nKbvv8MtX/pvq5Fqc6Vc5m06Jps
	 PEh3FbMbG6w1GUNMbesDU+jxUZzfRgmDVoJum4dUNjakaQCBxU21EaI57XkoIMZ/Va
	 TWzbqsFya5T3U2gV0qoqrIozOuxAPELnpRvtdSZQUDSEpcQTD6bzYvIH/EhA44fDjJ
	 HlrGHXoTyiLw99apzDFM0JEYGoElFGy42pA/dhdhG3ks86feBrvJsGTmc8baC6FWuN
	 PjzAozsSsKRUHnpHMsO6fhTalWL5RDlKpvBON0e96q/CqKsvOUO1j7Miq0S9jWuTJY
	 mO6LIK6s5p1dA==
From: Thomas Gleixner <tglx@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa
 <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
In-Reply-To: <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
Date: Fri, 30 Jan 2026 09:03:40 +0100
Message-ID: <878qdfmsrn.ffs@tglx>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 09:57, Janne Grunau wrote:
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Can the device tree folks please have a look at this?
