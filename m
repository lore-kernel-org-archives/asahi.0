Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410802;
	b=A3j/gf5FudvYvNDycWxH4apFQQ8SRYLV5NlSjzB7XxtbffRm82c5WxRbiuH56xY3Iu11
	 C9s9irPDp3AloNwRsQoKhl9PV08Mz9/ApWcCgAM2wsWklrK/qkMkEbqh32bAaeB2BmBQw
	 OejwlsvaAsUSIlGuWZooLh2DxTwUG3JcUQT+kuVRioryzJC9tQxq0QiDeGOnuQrPCaLjh
	 QU5OV+aknc+tce0Im4P2igtK46CiKljWTuGmscfqOvI8iUhE5JWeVlBH2Nb8ojLvEFqBy
	 b77liP8RHcEYZqaISTTDwLY58a56y6LjpRxe77PaxwI5lwzYoeSF2JDbRYv559Y6u0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
	b=3BCnreLvd6lWzFFFqrH4N0mAk6Z0Aw9Hr/nia+1HEKO74xsGkog+XRElsLpn8Nv6mmv3
	 3bg4PRMnh3Ax2jPzhFF4WOt9rXi1HR1cRs+F4NTbvjoxXNrAlwxDk+tNUW/6NPNPEO2xB
	 O8MC99pH6hnT4iTNqkAganyNKK5/3M/0066U7k+HfhmPn32QU2SsrG0nclPrZQfGULRWq
	 iZu0/DoNHCzuMXyA7KVFhZ919PVYxSMrM6hZJYPgeuuOQ6aLzYfmfF35uOEMIcroThczq
	 we8ViSRj0vZuoBJGBd5iJBzB1R4G0DjoBCtucJiL3DLSpBwuMMvvlEZhj2hQiHKPeJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uuLjp2f+;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC6606A31A
	for <asahi@lists.linux.dev>; Mon, 23 Nov 2026 05:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uuLjp2f+
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so6986998eec.1
        for <asahi@lists.linux.dev>; Sun, 22 Nov 2026 21:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795410801; x=1796015601; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=uuLjp2f+H8WKGpws7JxkutAZFBqcpwtkiT4nnA7Y5MNqAXGhxl7xSsasWBGXBaTfV4
         tW9U2r4fsZMDzYppV7XgokZfZMswsJUnzKnsHay0CfJbzoQtjXv3xzUYgPddvOx7T43Y
         eNGYEWbYFnoFgpd0ryDebdfKqSBktVNw78Bi7KKqgYd36CrZFbxLQ91PcbEDHOACDkaw
         Wtz1eKwCj7jHNh0UDCDD2LSdYj4vU01sKOlZ97FLJNHwCwa76ldoZvY3b5bg5CrGEMMe
         82iK/+GEK9ozRrjeaU5ujo+zhsfC1V6TcVe1aQMrpGUq6oebuNNU965hT6rTWg4KDIs2
         Kn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410801; x=1796015601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=TOb8N3OZtDiOC5p43ux4cuTrIwpcIo/BXQUqGrd7GbaCekN/75wLhRJoT4ol6qx321
         mHfo6BYFwtOBiqeAkLitbLL7nKUBb9S4yRE2LvfH+OKqL/NdakXxO8zECKMwcbpNl7HX
         agLChp5zP4OIJJEwZ01wNGil2oNAL5ihrBZiWDBYTzCyOkDuVEBB6qClFrK5crWHctZa
         4c8v6Ru9bwcitwbdRB6Ch4BI9lgyiN0pZeJa31pSZCDQTw3hJ9JsDrGsjowvRhuSzrNb
         f1teWdppRVr1k9SNdWyyMAR7khcDJ9SW0nr7JJnnorNrXDjzNdvKCTTBkjwp0mppkvu0
         pRJQ==
X-Forwarded-Encrypted: i=1; AL+hErGzLga8R5ps1JdjCT4g+Qgq+QHXm/HtgESSWNxNOLw46AOq2ZzoJU4+WSpSd8U9JaTWeOrBVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Z7RPl/HNsHPl79ZTDH+WlrTPC88KdPTefDicEGsXE5k+rGh4p
	zERersX99Llg5iXJUxcqz8aqvgZ4mZr1asK8pEX73Tk+Sm/jXWbA6Mg7ZgrdOhEVagc=
X-Gm-Gg: AZFdTZc/TGeIng34I4n5KrK6q+gPjT1vTSU6o3kKj7oWwcuLSnQlQCP7CQYPAyiCao7
	Y7eTYLyKERLYXSI3XhN6zqOe8VrP0n5RAqpLftAHxRB7VczYY7onAQK67H7lLJdHeAEkoR6BYZ+
	rn3r9LG9Q5+XLd6rMYvZEvbFDIN5RXLS1DUepS/n/DIlLFDjnAIs6neiAvp8WsPGchxKB3KAgiN
	4S3piG9hL6tA2CX6IwHBkkf4AR1O8p9HguSMsok10TgAM4pF9/SbwkLY93KQChRJUIyqrjf1QM3
	IL0jkTGo0DUnGvBA/6VOc/lgIlj22w2lahu20RRwuriYLIJlgbW6g9dBnlX1AuFYmg9c+vqKORA
	6oyWDLhzvuUr50lzM7JIk57149M2A37YIK4gegPBuUDOCAAxn/MTFpum9DjjbfVo6YKlf8Iv0Ua
	wwEUFHQ/62BStLN/mJ4xmiJgmGmFseFqxM2oQLF0wwrGrnSGsFBj8AEH8ICjNUWDMa3N1PFp8ft
	U81xxFFZDcf5K3j6A4y9y4X0ZlATf8Kt/o7BpOMGUh7AYMOUrc6FtQYIMbd9Nhu2XDtadfxxCQF
	0X4bo5PP2Uh49lFAR/Iajv1HLS+SSA==
X-Received: by 2002:a05:7301:4710:b0:378:314:4042 with SMTP id 5a478bee46e88-385702587c5mr10487392eec.14.1795410782709;
        Sun, 22 Nov 2026 21:13:02 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28221624eec.13.2026.11.22.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:13:01 -0800 (PST)
Date: Mon, 23 Nov 2026 10:42:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 M3 family compatibles
Message-ID: <awPLW-zURwW1dqZX@vireshk-B250M-D3H>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
 <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
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
In-Reply-To: <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>

On 22-11-26, 00:18, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add compatible strings for the Apple M3 family cluster cpufreq
> controllers:
> 
> - apple,t8122-cluster-cpufreq (M3)
> - apple,t6030-cluster-cpufreq (M3 Pro)
> - apple,t6031-cluster-cpufreq (M3 Max / M3 Ultra)
> 
> All three are compatible with the M2 (T8112) cluster cpufreq controller
> and fall back to "apple,t8112-cluster-cpufreq".
> 
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> index b51913a81791..516216cb6ad6 100644
> --- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -36,7 +36,11 @@ properties:
>            - const: apple,s5l8960x-cluster-cpufreq
>        - const: apple,s5l8960x-cluster-cpufreq
>        - items:
> -          - const: apple,t6020-cluster-cpufreq
> +          - enum:
> +              - apple,t6020-cluster-cpufreq
> +              - apple,t6030-cluster-cpufreq
> +              - apple,t6031-cluster-cpufreq
> +              - apple,t8122-cluster-cpufreq
>            - const: apple,t8112-cluster-cpufreq
>  
>    reg:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
