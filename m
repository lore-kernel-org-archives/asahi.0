Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7445041F
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931271; cv=none; b=oHehGKEJx1RtQQa8K7B/VtIPLQDE8jy6VkoXBgY7uL+fodunM2Qa6mQepKYoy/TYIAYm3Pz05mhTgb7lwRd82Tn5z3SrkHavkV0nTndT+aldYRGERIWZsYm9ELp7uiEHDohzd2rJlGvbZ2+KhFUq+2DWm21ceTL14c9kNrzWKEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931271; c=relaxed/simple;
	bh=S1bpO/a/IYDb+C/gEPnfHVorUR1nee+MmFX9LOa+pEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twOMCSEHoe5TkyuJBey8Pq3XplyQXwp3kj2JThnKlj8j6b1qnJ8EWDWoytLfEJyx7wJ94wKcpG+pqxX1Z0GvNmCufLsXmg1D8RIpJ/6xM/VhJMRAMx2hUakB2RtHaz+VBoIMtHG9TLu5OWt1BV02ceqNHHwEDU+t1rZVCz3d3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=E05HXm/Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dWNJGggv; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="E05HXm/Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dWNJGggv"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B54BA7A01A0;
	Wed,  5 Aug 2026 08:01:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 08:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785931266; x=1786017666; bh=5MQvhAxG1f
	SqcnM9RTDK76h0pQKuMYfzXFqMmTxpBQY=; b=E05HXm/YNHxLxIVexe1UoQQiJq
	Vev6NqOk6cx8ELleiIa4AF10i3E4qQlgJqGi1vidsosYMWDyFSx0neaY69g3XTD2
	RgSaPgWNi4jGF6dtGCG2CxVYhUe1im30CCKOzU/OgnMG1wY/nuzqzoJC0oupnJO9
	DtmKTUV+gflbtP6px+n4tR/FoUXqA8kSVBUK5k7YE5bohYsgBO/H9YkPsOuBRJei
	RmVlcxQpvIc/OPK0HuGb7ZIG9+y9+xZFjgsFepvRB+e5bae5Fn6Q4l3iYAF9o3Av
	7uNFHpSmaB5IZ6sVZiL5YueOzwV7/CNbUlspJFXxoXp8EPlJNG9pgeOXoNdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785931266; x=1786017666; bh=5MQvhAxG1fSqcnM9RTDK76h0pQKuMYfzXFq
	MmTxpBQY=; b=dWNJGggvtpT6iwE9Wy99ofxXiQ0ZPCqfU1pmIBocydxVH8vWj7n
	yFzat6WEpTk0VG2cQDA9yeFpECLdYXHjcR+HEsWERyL+e1Gw5YzKjvoFqxL3oGHj
	3iUl9IG0nZlts00H/CA77KPSROU5QMEdbdZTTkmgPNsgBuMq6gexAmOf2VKLYIn0
	0NS1w498BLl898kENaL2miJ51JUC33F1zUyfhsWSZQEsWosdyufnLIq7kcSZGowF
	cC4O0C5O5wyVahIvwLeZsyA6gQqX+5NMJ8oowENK5F/j9vow1vmaZIHXVnbFKRHW
	8S/Tur97yMnUeBIUj9e7vcWmwdDms5qe1KQ==
X-ME-Sender: <xms:AiZzakej4iVR_nfvt5VsJU2HcuuuJtH4icAlPmEWY2TRzyhzjFTrtw>
    <xme:AiZzaiC61pQzLghBDtFJW_51QgnWrsFwASYGSIeSfal-WebGBdJin4JIJMQKFwtSn
    KKlUmrdjk-LaOpac2AyNA1-WfMMdpT4XimLMj_7E_ygtLZAWUNbItGm>
X-ME-Received: <xmr:AiZzag45d2i93tI3K-ZGU9tdCKnaVJk-th0xrRbDnz9kID2ijW-iQWKSbwSiEinD3eexR66mifvWtNyGcioPKYzHdd9TQ-Wk1no>
X-ME-Proxy-Cause: dmFkZTGSCvmqUN+IsE2KmJvj1RxF6z1AYhEl2XfIj+8NagU6Bp39Fg2oB1JUJr5PsRTwMG
    jMoUWmja4vcJNXCkHN/usghvo9RfTDMVopb/p+XwpiiIbJzL9YaybGpF5/s8LJqKnr8X9g
    0LgK+re00njxntKPTOBM3LyrriqCYY+ujVnzOHPn3S9QZFTnpWkkvj7XNIOMqFxO73BGra
    9wh4KjOS/ek9lZ6U2EWXnMsFZmWWnUDiZutB9I/qvrTxfjnUpSH8S8PcRiy1qOrlFrJxf2
    w4aUKn/G1aciprGW4ig6hL2ugn9/XKvg/+auuXK7VrLBrs+g8r+c3DcWLWwwRJKJsRrgew
    is8NhOE46SyzV1kbXf+5YVFQkXxNrwp92Z0ZoRaTg7GgFF2ruWXH/N15HH+IqERBsAfqWX
    1978LDNTsMzPaiXmwdM6nFejs8I2Ay2OKNo1yio6evgjPi9U1SJ2HJsxU0+rq/d2HyWwrx
    li5oRtVy1psAcBAp/6bJR8UEz/E7CozOeducFuAmXZSl6NhclargP/iMbr6oURrBfnmD85
    vnKeD9Kywyxoyduw7tAl+YyQVgNG/wKhT/EMcH3yaQjHkW+49ttiHZfVt4XyxEi7KenQrB
    cT4ltyVZLy1rfhz1xffCUawZBrU+2HA92q7bGXBJVbNHXE13+nEdl8vIubRA
X-ME-Proxy: <xmx:AiZzajccnIc-tnNDC6kFyovtzDdjpTY3kF9DI2sc01CmzDx8wvPYPg>
    <xmx:AiZzausDEPq2jXNVe8EaXo5AuOrfB98XTyW9E1OS3Gfu4eSx6GyZFw>
    <xmx:AiZzarme-W224S6rjAez9B651b8TPo6goB8m6z_wjWYIgmWACkn5nA>
    <xmx:AiZzapTYB6Kn_-yfDyKl69WPywcyDmg3b4ZugSSsHpyGRgIJT7V-GA>
    <xmx:AiZzap4NZSxzt8u_uuxX-iAKsxs_fdOWo_gVtkh-sR7OZ7w-Rtzq9XQ6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:01:05 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:01:03 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Message-ID: <20260805120103.GA832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>

On Wed, Aug 05, 2026 at 12:11:11PM +0200, Sasha Finkelstein wrote:
> Add t603x compatibles, interrupt support, and support for SPMI
> controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..fceed47b2cd1 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,6 +37,18 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
