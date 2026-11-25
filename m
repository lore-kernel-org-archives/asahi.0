Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.70.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598280;
	b=RJUDZVIsoaHWlOzYNiy306DxpTPreFruHXn4931/w9GC6SI6cBhsG07WJAZWsQBoJbqI
	 DiYhlEBULKFgp3fYBtCLB5k1GidbRxOdAr/lKtHUVttTifQ+S3FwlbzCcyVenrS2u0HzU
	 gCLyRMrQeLvX1NMEgV0E42ubUkEuZZ6yJqR+BdKFdlDwD2s4uSHfdsv/WY9CAZLLuhh2Z
	 Ww20+5sCAGZQ7rOoeyYS44f6My6cdbNchsCrff68bTTuMXyf9fQNcYAJMEG7GjHCLXlBI
	 nOOYPhcrsd9wG4Un32s1wFmahnrGHh4CTS3QaC0upG6Kvqs334pe/fUQqlbbpiKea3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598280;
	h=DMARC-Filter:Received:Received:X-ICL-RepId:X-Suspected-Spam:
	 Dkim-Signature:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Info-Out:X-JNJ;
	bh=RE4nSzhPu6nNuyJJSMGMQ9YMNE34TPzHguxazmS11yg=;
	b=FDe5NIVoNPAef0PiuFVJf9RCDkHYZ4y5fs+47EziXo8xtoVRWXp9LRIgL4E2NIzRQfKa
	 LqRN7P3XbJagqrANESZjavo/I/t6sDQIroGtTwFTMbzkGCwHI1FOb48KeputZAT/sK+wB
	 SHgfkf3ou59nCnfwYim/iU4k7gERRfVshe6KJdpbmiaUzvC/4laChE6iERHMqqSfOSQeD
	 ChaRmubuId9/PPypIAdDi4eQsKWGBG3yOp38e6vQteZ3flXHOJQzynZU0otujuzHuyU93
	 sepVnDj/0g5mxq7HWsQI5YngfciHMktxOIjwFDW0JsA4o2zSsOb/bR2a/NiSvgwbJKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=R+g2sAN+;
	arc=none smtp.remote-ip=57.103.70.209
Received: from outbound.ms.icloud.com (npq-west2-cluster1-host4-snip4-8.eps.apple.com [57.103.70.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C61606A68D
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 09:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10C61606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=R+g2sAN+
Received: from outbound.ms.icloud.com (unknown [100.84.204.149])
	by p00-icloudmta-junk-forwarder-us-west-3d-0 (Postfix) with ESMTPS id 5C421180009A;
	Wed, 25 Nov 2026 09:17:57 +0000 (UTC)
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id E998A1800126;
	Wed, 25 Nov 2026 09:17:54 +0000 (UTC)
X-ICL-RepId: 01a211ff-5133-705e-a341-6f0496d6e762
X-Suspected-Spam: true
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1795598277; x=1827134277; bh=RE4nSzhPu6nNuyJJSMGMQ9YMNE34TPzHguxazmS11yg=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=R+g2sAN+dX9ZQzhX0AsjOBTVxobIJJVbgjIELwrmupiccO8iMYq3cHwkRX0nE+2W/HuoBSVNkYnf24cCHr+tyPGIjAD6ZPvQY/oj4peQBXNT//LDpKJkARo+TLHMfUlS8HJsrFntpMoo7nTIOwce8Jf+4NVPWPp63IaPIBwZyw15+MIR0CJ4b2MekLU2p5BJsClg0ThuP4CZ9VRiiUpX6YAev2NCspXARDbdaL2gecKS6cmruwcTzsBpGr28pf8wOEJJSFmYpCa6VLJ0vAJT7xSreLzjGhnC6OgmZldYfJCtsDSXJwglTRlrcEa+loNQMVIEDDzpw6MkgxowPsEwvg==
Received: from m3 (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 01BD4180011A;
	Wed, 25 Nov 2026 09:17:50 +0000 (UTC)
Date: Wed, 25 Nov 2026 10:17:46 +0100
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
Message-ID: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
X-Proofpoint-ORIG-GUID: 7L-1DbM7PFVkvAA3Ve1k7TBSWwo3SVaA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX29jAdByKWjWC
 MNQIzTlmJrKNzVWV54m2//FbR2nhduOrYoFf4zjYOzjVek/OANeigkcGew+NNcfHysAca1ezJ4B
 Bbh+Ryd+eKnwz1vny6jmPBSGUMbb8VU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX1ew1RDQihZ4U
 gqzd9wpFsKesraYPQpkpbJFUUWr4MInreF89q9QWG2aGtO5Vk2mOAXlZWsKUgiKuMJBPOxxkaCv
 ep7ZuOICgu4lxbHoX3hPd32qe9BYOvNPKzP0ox/mOBTRv8LBVP06a+G6uJmxDg+LJex4zRhfF64
 VlwNOqGLRNbgfRNypDje5q8juEFk9tyQ6I03hpyKNul/xeKsqJ6cNfCEuRl8CG4bKVy/uFzVxO/
 yyOk4WrTjWwdpk0MYvWewMUSxNSZSpkrRZc1e8ttGRKX/S9iTWGfyMrh1THuaFbhebXOAWy0+7g
 2v3LP1cX27qGbcfXZlWIcLsqjHCZeiFWQhS0TSKOe0r9v29l/hdgbGGr3toy7Q=
X-Proofpoint-GUID: 7L-1DbM7PFVkvAA3Ve1k7TBSWwo3SVaA
X-Authority-Info-Out: v=2.4 cv=W4GtxhWk c=1 sm=1 tr=0 ts=6b06a7c4
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HxOO8S7qDNDRVQTpMkN7:22 a=Da-wPGOzCPo0rgK0bsWi:22 a=v3ZZPjhaAAAA:8
 a=LAvkwPmW8R6kQSckoZUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-JNJ: AAAAAAABC8pesed8V/geFCW1TZj2dJcUbicq2KvDcOZ9YrjKbx3sY7Ya8S3qw3RhF2FYCF
 Wj9Jn4ryX6e+jO/Q19iIPcfeg57ZI75FynxP/ofNbtRs47aaEayS9jO+6hlhqeXrZnGdEm
 IKMb88Q+eU20dkCih9U9S4DURvAeiDp7qEwxxCjPjVkvFZCWWYUm3KjidPxqviR3/xVSZU
 oIatsaGkkESdfZiVm+ZcLbbObwqgwb6kbZH8+p1n+Xl77iAiGnPuKj0ZQjB9kZNYVdB/Wn
 VvvHHH0kXQYyiknz2FTnCgWYWD9x53HOkCu1ITiXg92iv6nVpv2SQaWI2Zoiyum6vmh4Mb
 1KThVeuKNHMzbFZKX8FWjHyTepdVvoTA8gSwSUVihYaGRN8sDdgDoaVth3X3w19pQlp22b
 WHqz95BucgpkEwPlbd2pGIIijs6kOdufEgwJE3BVAxSGGbx/jZ64Mw35Vfz7NE1xD9FWVl
 M5eJOhUETZ/VSOs8MtU3ABK9JUlqFv3mclEsFPJoHb6K/jeMKPg4Gqf98WEvCBfnwAi0kV
 KpDlD3XJFC0nH4BzTTje2tVRNSyFL1tRAMtZlxy1czc9HmoYEq4jPf2pCoShKk8WK1adyx
 SUomRl4hUiNSvUuIhGXYJAspwTDJWZM+mgWzq8BQXqE+VBil7QOnBWsCNd4d7kmih7M9L0
 9g1FStN7225K4qeDpRETWWlQnL9NzeArOnWpxcBw23o+ppYXncnXEg/g/kY940PhBaU1mo
 UYogYhVwbfsofxd3CcLadpAK+fzfrNLbKT6bH6i3Cg8wjaoZdLA6TcArjBzlwGDRVCstZw
 HAf8uKzRxnBMxA0Mkx4rWfskcT1L3GVUZu1RjwVMa8fv2W3NTCTYGdfUOq8YfzQ/CC7AaW
 e0+rgmEcyRi1NZwMTvPNmCYCu2DaTYBV6BtJ9foOLkLzoOFqLLJVmgx/3eaTCf82/av42P
 PbgSFtv+vW+xY5QSeKE9Q8oMTB+BCZKu3D5YeolV2CAu79zJ88K6EpUUN7qr7vWq0L1FbS
 2dlUeeooCl2tvXyJk1oueUjXQZmlhd2VURiIfpAcElFZR1lt1T54svOfeLlFrd6mUZqLAt
 6abvPX8acEf6qm0N3JsFNhBw9gQ3qRkKXyZwBTOVYRgUyGV/fFWjOVYRMR3iqZ2b3gsza/
 n2tkwaMTMOMwPstG6ifC6c0V1AoC5BMM4rK/OO7U0xlLk7SdHGYrd553+cnAIUb5cPvFvj
 DmYg6CFFMV6hDEmFFF/iIc4yE6Gn8JAbMHkwOpqsAWGnZ3aiWkmzv7P43uekQkQTGLSbqm
 ZZI5aLtlC0wzoxLZY6o/LMlf/ZAbjG4OZYC02wj1N7g7eTf+uVgvk9yh5QhpEhIYvhQ8TV
 ZvCmUD+6EHH1sNEpTxhwJw6Tcu0FJgMkg+hExXpUwFOghj7TUmNHW6MG1oCWtlgDynLGQC
 1r4A==

On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> Le mardi 20 octobre 2026 à 11:37 +0200, Sofus Forstreuter a écrit :
> > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 922cf74c4eb8..384ff77771ea 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
> >  	 * According to the spec, tile_cols_log2 shall be less than or equal
> >  	 * to 6.
> >  	 */
> > -	if (frame->tile_cols_log2 > 6)
> > +	if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
>
> Shouldn't this be 6 too? (log2(64)).
>

The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syntax):

tile_rows_log2 = f(1)
if (tile_rows_log2 == 1)
  tile_rows_log2 += f(1)

This is also what eg. gstreamer does. I will add that to the commit message.

Best regards,
Sofus
