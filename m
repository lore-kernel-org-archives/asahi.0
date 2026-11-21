Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271146;
	b=OFW3qFxmrlNdPp+rcjKPlTc3DbpQhH8Xho5P7eXwiFvsaUP5kml9qBoXE+7scM1CZQhe
	 2bqRHapNdGiv21xTN1/oBrSn0BzF0vNfAyIDakBRflK75qv8qEiXm7pkD5g+//GwoWVT4
	 ZHKA3DF9fUix45PoCcx2Gk+u/EWiqsYCXsmEqmPNRoCezW2XlDIt6ufbRt1xcUMyAKDZ7
	 QM/NkZLzMTTX2NRYKKljHglKwTakYJGV0LwdsxBD2TrgN6bWWUmipfcx9XhWMkyeZvPJs
	 UobXq6G6+ZfYGegw3wIF09i0q+WkOyt0TSO2bSd58Gfiivp4/670WD+7CdAij3cHf5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271146;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=4yLdjzypeFQK7f+kiGZvTVFiKT3fyjUdHSNHpd8axi8=;
	b=OymBhCsTyDdmTKYNdxIHG46kGfN3daoAYyWH43hF843TkgQyMkv9bxnuZEP+VcfjlVtw
	 qvOQsWWYoWU5bsK0bTkNMgIfl7jhnej6kJpFdKNtgN7WEztbYaW/WTb7ZrvdRrNyn8zwx
	 W/Dro6LmaFChxnfNoxa/f3lh7TzdhdeSwrQwjmU/kB/AfEQ03fNrP56nmOKUfAKUdmn8Y
	 qH42k3SGWpwtH5bPO0xiRJsva4CBK0gyonlLPCZ9eZC6AuEgEtRnpm6Ig83UodnUAu8dz
	 RUjUx3sjb7jGXP+4CCloYZvlPGdd6C+8Pqwop0bpFMkh+1tr7NXk8KoMWVlABd4GuIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMv6wg+K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BB606A691;
	Sat, 21 Nov 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMv6wg+K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A791F000E0;
	Sat, 21 Nov 2026 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795271146;
	bh=4yLdjzypeFQK7f+kiGZvTVFiKT3fyjUdHSNHpd8axi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mMv6wg+KHbmuJqGJhIWcQApu6QRFrkfkUycS6llNG+mGbT5ycv6Ab0iQobuM+qVTC
	 8Hgo+eCJTAfXJPPvM4Ccku2V07hPavM/LRbvrcCezb5pRYO3bx7Gfy9s2TAhVNHFxl
	 ytnfCWbOpTWf4GUEcPN4xni5bZ6arr4EoNLkqAqtlUSa9OtSfgA+ttPSkntlXck0ex
	 PjBQtR0tSvONw8g3QTwhSUTlF/89k1gyFaHSVeSadwXJPdrDW5w17Z42mzdwSfhza+
	 egohp0KYy+UB48GYh5RqTWt9sz/D5v/XzwS3ctDzhQB8WOLxdgoTusuEI0lVFpjK9C
	 Tly0bU1iTbBNw==
Message-ID: <54d2b875-6d6b-4c0f-a1ae-3dbfdb46f4b1@kernel.org>
Date: Sat, 21 Nov 2026 15:25:41 +0100
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
Subject: Re: [PATCH v9 3/3] usb: typec: tipd: Add sn201202x support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alyssa Milburn <amilburn@zall.org>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
 <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21.11.26 14:07, Sasha Finkelstein wrote:
> Add support for sn201202x (aka ACE3), a tipd variant that uses a very
> similar register map, that is exposed over a "logical register"
> interface on the SPMI bus.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Co-developed-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven

