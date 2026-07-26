Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9960C1D5CC9
	for <asahi@lists.linux.dev>; Sun, 26 Jul 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785076893; cv=none; b=VT2SlJsbhJ0rLAJZH/lNWYT6UAKFYHFrysfMV4t1cXhNmO+MjxV6HeQ/UE4FvSTcMRvb4pHqHelnU8y4TkvjDukeAq28zEcNn0VOWwOgjgK9lOJWnGwPdyaSGube5DypLnJ3is+LRBPff4AXrjp6WjxZnvz+jkmPILPXAeHWjWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785076893; c=relaxed/simple;
	bh=t00CVuaIfi/20NLrKxxqW6T3Z61lbDc0EndKmd4Gzgo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=RV1nd0OQUYGinlTVH1LUH4AtTpxT7jvUxBEp/iQLXnLr7utPU32xhZkhB+m3tRXHq+mdiRGa3O4usmy25dNTzMl5zzlr19n9CbSNP/Dwx+yascq+oouXLEWwv8v1h0rLtwIrNIprK5MkM91pG0D96E/j7/eX7O9OsGS+DIrbkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=cegTEO+T; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="cegTEO+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1785076890;
 bh=wxXmArkr7I9p8OzXN7Q07cbSHLBGjb9XXJaQk/wXaiQ=;
 b=cegTEO+Tqw1ZSZXEp/iNbfGtaT7CKyclH1VJZvowD8BsnKn8izc+3x48373YcNPz50YizUIA7
 gPQQoDzPUv3CFr2rRhAxd+5OOZvNiH37I3+hILQ3kNPXHdF4qSt/pqR+J+oA4hh/sTUx6fq58fM
 anyfIQK538B6ETuSE7co6FR089UzVlK8ABl0YQ1VkRG5VIfj8OiqDOX+bgJHC1wg7Zmv7fKQ0g+
 8UuruwXIXSKsAVuGqZhEGUdlNSnIAFl9wDShRE+r50MlVwV/piB+Oby0h0dlAL4JcUIHLxu4mh3
 oHBfGnI+8LkspO0kqt2uwkySgkNt7oe0qRlUVO0wGRXA==
X-Forward-Email-ID: 6a661c98d1c8002293af8ddf
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.12.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 26 Jul 2026 10:41:27 -0400
Message-Id: <DK8KY15BK9O8.382YX2M15Q0EQ@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sasha Finkelstein" <k@chaosmail.tech>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] dmaengine: apple-admac: Add support for M3
 generation
X-Mailer: aerc 0.21.0
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>

On Sat Jul 25, 2026 at 8:25 AM EDT, Sasha Finkelstein wrote:
> The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
> additional register writes in order to function correctly. Add a new
> compatible chain for those, and change the driver to do the write.
>
> To simplify the merge strategy, the device tree entries will be sent
> in a future patch series.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Sasha Finkelstein (2):
>       dt-bindings: dma: apple,admac: Add M3 generation ADMACs
>       dmaengine: apple-admac: Add M3 generation ADMACs
>
>  Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
>  drivers/dma/apple-admac.c                              | 32 ++++++++++++=
++++++++++++++++++--
>  2 files changed, 38 insertions(+), 4 deletions(-)
> ---
> base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
> change-id: 20260725-t603x-admac-a1b07a2ccb54
>
> Best regards,
> -- =20
> Sasha Finkelstein <k@chaosmail.tech>

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
