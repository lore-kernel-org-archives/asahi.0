Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795269864;
	b=Og54skZYtrdoxT116k5GVbFd9n9hudszm9ut2d0Z1SNTrQ37QzeiFBm/SMDB8X/pQi0G
	 qBg2+ECMkhRjsb3rrSWIUosvjbaQ9mDrh/ELutQDLxdpswmb7FO91OE7jsQpfb9bALzWP
	 ekQAXZMjiGoE/6BEeorniOm3iPuhK1gK+DOjZopWFDXLaT/7wrH5SLIzUVA8oygQWsj2P
	 eZx1ANvPIaU9y4PaAMz+xZKh5S72xyG6GE+yYMWh5AvgCl/4rK4GBWbYHFGcIMYW9YAsz
	 BVFQHA5fUomzkPnux0EqcOsId4rKbAK+ODc7KQNXQZPiuUrer9MjJgLRgOdKEyAv6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795269864;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rrvd13JKTAJkceUzoJ4Gts0V19EDKxpu2AyZhzxOjdk=;
	b=4bNiTnOpGguzO+oKALPQYoE3wjeK8SGliiiRwYZm3yZHdq/mU0q75SxLWjXJVcV9Ru8/
	 MmyRvj5ga/rHiHBOlJ571ODD5qstS+BHCnOafccOqWoiG2ifikgua68NKId2mUyU4TcM7
	 esMHglx8qM+8XpCw2kuHdgMt5jOxxWKGnEcMcF8m9sTKtVx7Xx14h2qBOTZv2daFwxwwM
	 J74R7b9rx445LokIbmsfxb4lYIqc1HCbnJVxQxIGr/4n/LfrO/wyD2WMJYOel+tSISGP1
	 1ZjYBOg/voaQCPj0e8a5PQYOWSQzbX76Mdfiyg8Dg6Cw03fHdk6ZZK9bprJHlParugA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKc7kr3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD656606A320;
	Sat, 21 Nov 2026 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BKc7kr3P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A55B1F000C4;
	Sat, 21 Nov 2026 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795269864;
	bh=rrvd13JKTAJkceUzoJ4Gts0V19EDKxpu2AyZhzxOjdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BKc7kr3PEUvu1FyLwIC7SJ1m7toK7k6mXnXtMuFUjmFZ/GWsZ9tJ4vMiOg7oHWeLT
	 sPio6kfyM5284Nq1C7bgWVYxuWT5H/tgvtCuJRJHJGJLgJcHtxjbJKT8Lq0qX8eelG
	 szBIP+LL3Uw6iDCLYJmq5SxZxBFiSVWmW8J/Gy+kyOar7ewJcb7oujr/ilwVWr5LiN
	 2LXc9lOVW8nwUmzeAxnNx9eJZhLiKy5keRxxB2Xd8JIvjqSQ+TuJe2W0HV5VNv7Xgp
	 0NzcNKpCkoz5hrDVYmFjoQyzBSG15FKyZeKqyASfXYn2FU4Tv1JW0gIIasrTzwXZzE
	 jIe6IfcAyP5Lw==
Message-ID: <57ef8e25-c4df-4907-8f05-0a104c537d89@kernel.org>
Date: Sat, 21 Nov 2026 15:04:19 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] usb: typec: tipd: Factor out i2c specifics
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
 <20261121-tipd-ace3-v9-2-9a2f1327a330@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261121-tipd-ace3-v9-2-9a2f1327a330@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21.11.26 14:07, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>



Thanks,


Sven

